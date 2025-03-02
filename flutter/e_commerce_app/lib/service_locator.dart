

import '/data/auth/repository/auth_repository_impl.dart';
import '/data/auth/source/auth_firebase_service.dart';

import '/domain/auth/repository/auth.dart';
import '/domain/auth/usecases/get_ages.dart';
import '/domain/auth/usecases/get_user.dart';
import '/domain/auth/usecases/is_logged_in.dart';
import '/domain/auth/usecases/send_password_reset_email.dart';
import '/domain/auth/usecases/signin.dart';
import '/domain/auth/usecases/siginup.dart';

import 'package:get_it/get_it.dart';


final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  // Services
  
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl()
  );


  // Repositories

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl()
  );



  // Usecases

  sl.registerSingleton<SignupUseCase>(
    SignupUseCase()
  );

  sl.registerSingleton<GetAgesUseCase>(
    GetAgesUseCase()
  );

  sl.registerSingleton<SigninUseCase>(
    SigninUseCase()
  );

  sl.registerSingleton<SendPasswordResetEmailUseCase>(
    SendPasswordResetEmailUseCase()
  );

  sl.registerSingleton<IsLoggedInUseCase>(
    IsLoggedInUseCase()
  );

  sl.registerSingleton<GetUserUseCase>(
    GetUserUseCase()
  );

}
