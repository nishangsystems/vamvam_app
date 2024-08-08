import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  startLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
