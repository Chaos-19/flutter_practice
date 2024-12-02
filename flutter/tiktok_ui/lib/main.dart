import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tiktok_ui/models/theme_notifer.dart';
import 'package:tiktok_ui/screens/home.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (_) => ThemeNotifer(),
      child: const TikTokUI(),
    ));

class TikTokUI extends StatelessWidget {
  const TikTokUI({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifer = Provider.of<ThemeNotifer>(context);

    return MaterialApp(
      title: 'TiktokUI',
      theme: themeNotifer.currentTheme,
      home: HomeScreen(),
    );
  }
}
