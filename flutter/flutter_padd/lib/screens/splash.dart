import 'package:flutter/material.dart';
import 'home.dart';
import 'dart:async'; // For Timer

class SplashScreen extends StatefulWidget {
  final bool isDarkMode; // Current theme mode (true for dark)
  final Function(bool) onThemeToggle; // Callback to toggle theme

  const SplashScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to HomeScreen after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen(
                isDarkMode: widget.isDarkMode,
                onThemeToggle: widget.onThemeToggle)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue, // Splash screen background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.flash_on,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to MyApp',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
