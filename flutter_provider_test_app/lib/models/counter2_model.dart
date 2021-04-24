import 'package:flutter/material.dart';

class Counter2Model extends ChangeNotifier {
  Counter2Model();

  int counter2 = 0;

  void incrementCounter() {
    counter2++;
    notifyListeners();
  }
}
