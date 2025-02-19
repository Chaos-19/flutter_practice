#!/bin/bash

# Base directory for authentication feature
BASE_DIR="lib/src/features/authentication"

# Create directories
mkdir -p "$BASE_DIR/data/datasources"
mkdir -p "$BASE_DIR/data/models"
mkdir -p "$BASE_DIR/data/repositories"
mkdir -p "$BASE_DIR/domain/entities"
mkdir -p "$BASE_DIR/domain/repositories"
mkdir -p "$BASE_DIR/domain/usecases"
mkdir -p "$BASE_DIR/presentation/state"
mkdir -p "$BASE_DIR/presentation/ui"

# Create files and add content
# Domain Layer
cat > "$BASE_DIR/domain/entities/user_entity.dart" <<"
class UserEntity {
  final String id;
  final String email;

  UserEntity({required this.id, required this.email});
}
"

cat > "$BASE_DIR/domain/repositories/auth_repository.dart" <<"
import 'user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> login(String email, String password);
  Future<UserEntity> register(String email, String password);
  Future<void> logout();
}
"

cat > "$BASE_DIR/domain/usecases/login_usecase.dart" <<"
import 'package:dartz/dartz.dart';
import '../auth_failure.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  Future<Either<AuthFailure, UserEntity>> call(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      return Left(AuthFailure('Email and password cannot be empty'));
    }
    return _repository.login(email, password);
  }
}
"

cat > "$BASE_DIR/domain/usecases/auth_failure.dart" <<"
class AuthFailure {
  final String message;

  AuthFailure(this.message);
}
"

# Data Layer
cat > "$BASE_DIR/data/datasources/firebase_auth_datasource.dart" <<"
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthDataSource {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthDataSource(this._firebaseAuth);

  Future<User?> signIn(String email, String password) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return result.user;
  }

  Future<User?> register(String email, String password) async {
    final result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return result.user;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
"

cat > "$BASE_DIR/data/models/user_model.dart" <<"
import '../../domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({required String id, required String email})
      : super(id: id, email: email);

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(id: user.uid, email: user.email!);
  }
}
"

cat > "$BASE_DIR/data/repositories/auth_repository_impl.dart" <<"
import 'package:dartz/dartz.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/auth_failure.dart';
import '../datasources/firebase_auth_datasource.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<Either<AuthFailure, UserEntity>> login(String email, String password) async {
    try {
      final user = await _dataSource.signIn(email, password);
      if (user == null) return Left(AuthFailure('User not found'));
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, UserEntity>> register(String email, String password) async {
    try {
      final user = await _dataSource.register(email, password);
      if (user == null) return Left(AuthFailure('Registration failed'));
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      return Left(AuthFailure(e.toString()));
    }
  }

  @override
  Future<void> logout() async {
    await _dataSource.signOut();
  }
}
"

# Presentation Layer
cat > "$BASE_DIR/presentation/state/auth_notifier.dart" <<"
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import '../../domain/usecases/auth_failure.dart';

class AuthNotifier extends StateNotifier<AsyncValue<UserEntity?>> {
  final AuthRepository _authRepository;

  AuthNotifier(this._authRepository) : super(const AsyncValue.data(null));

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    final result = await _authRepository.login(email, password);

    result.fold(
      (failure) => state = AsyncValue.error(failure.message),
      (user) => state = AsyncValue.data(user),
    );
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    await _authRepository.logout();
    state = const AsyncValue.data(null);
  }
}
"

cat > "$BASE_DIR/presentation/ui/login_page.dart" <<"
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/auth_notifier.dart';

class LoginPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: authState.when(
        data: (user) {
          if (user != null) {
            return Center(child: Text('Welcome, ${user.email}!'));
          }
          return LoginForm();
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
"

cat > "$BASE_DIR/presentation/ui/login_form.dart" <<"
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/auth_notifier.dart';

class LoginForm extends ConsumerStatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(authNotifierProvider.notifier)
                  .login(_emailController.text, _passwordController.text);
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
"
