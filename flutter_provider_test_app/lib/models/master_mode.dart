import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_provider_test_app/models/counter1_model.dart';
import 'package:flutter_provider_test_app/models/counter2_model.dart';

class MasterModel extends ChangeNotifier {
  Counter1Model counter1model;
  Counter2Model counter2model;

  MasterModel();

  void setModel(BuildContext context) {
    counter1model = Provider.of<Counter1Model>(context, listen: false);
    counter2model = Provider.of<Counter2Model>(context, listen: false);
  }

  void incrementCounter() {
    counter1model.incrementCounter();
    counter2model.incrementCounter();
    //notifyListeners();
    //
    print("MasterModel counter1 : ${counter1model.counter1}");
    print("MasterModel counter2 : ${counter2model.counter2}");
  }
}
