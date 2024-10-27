import 'package:flutter/material.dart';

class TestSeletor with ChangeNotifier {
  int value = 0;

  void inCrement() {
    value++;
    notifyListeners();
  }
}
