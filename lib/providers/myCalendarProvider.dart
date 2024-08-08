import 'package:flutter/material.dart';

class MyCalendarProvider extends ChangeNotifier {
  DateTime _mySelectedDate = DateTime.now();
  DateTime get mySelectedDate => _mySelectedDate;

  setMySelectedDate(DateTime value) {
    _mySelectedDate = value;
    notifyListeners();
  }
}
