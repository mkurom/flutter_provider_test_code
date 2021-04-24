import 'package:flutter/material.dart';

class Counter1Model extends ChangeNotifier {
  Counter1Model();

  int counter1 = 0;

  void incrementCounter() {
    counter1++;
    notifyListeners();
    //print("Counter1Model counter1 : $counter1");
  }
}
