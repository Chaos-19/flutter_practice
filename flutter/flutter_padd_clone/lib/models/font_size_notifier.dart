import 'package:flutter/material.dart';

class FontSizeNotifier extends ChangeNotifier {
  double _fontSize = 16;

  double get fontSize => _fontSize;

  void changeFontSize(double value) {
    _fontSize = value;

    notifyListeners();
  }
}
