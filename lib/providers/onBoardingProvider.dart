import 'package:flutter/material.dart';

class OnBoardingProvider extends ChangeNotifier {
  int _index = 0;
  int get index => _index;

  setIndex(int value) {
    _index = value;
    notifyListeners();
  }
}
