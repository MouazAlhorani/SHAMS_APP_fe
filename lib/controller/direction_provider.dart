import 'package:flutter/material.dart';

class DirectionProvider extends ChangeNotifier {
  TextDirection _textDirection = TextDirection.rtl;
  TextDirection get textDirection => _textDirection;

  void toggleDirection() {
    _textDirection = _textDirection == TextDirection.rtl
        ? TextDirection.ltr
        : TextDirection.rtl;

    notifyListeners();
  }
}
