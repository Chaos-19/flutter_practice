import 'package:flutter/material.dart';
import 'package:flutter_padd_clone/constants/constants.dart';
import 'package:flutter_padd_clone/models/font_size_notifier.dart';
import 'package:flutter_padd_clone/models/theme_notifier.dart';
import 'package:flutter_padd_clone/screens/home.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeNotifier()..loadTheme(),
        ),
        ChangeNotifierProvider(
          create: (_) => FontSizeNotifier(),
        ),
      ],
      child: const FlutterPadd(),
    ));

class FlutterPadd extends StatelessWidget {
  const FlutterPadd({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      title: 'Flutter Padd',
      darkTheme: darkTheme,
      theme: lightTheme,
      themeMode: themeNotifier.currentThemeMode,
      home: const HomeScreen(),
    );
  }
}
