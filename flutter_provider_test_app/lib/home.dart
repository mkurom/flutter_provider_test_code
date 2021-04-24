import 'package:flutter/material.dart';
import 'package:flutter_provider_test_app/models/counter1_model.dart';
import 'package:provider/provider.dart';

import 'package:flutter_provider_test_app/models/master_mode.dart';

class HomePage extends StatelessWidget {
  HomePage();

  @override
  Widget build(BuildContext context) {
    print("build Counter1Model");
    final counter1model = Provider.of<Counter1Model>(context, listen: false);
    return Consumer<MasterModel>(
      builder: (BuildContext context, MasterModel model, Widget child) {
        print("build MasterModel");
        model.setModel(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("provider test"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '----------------------------------------',
                ),
                Text(
                  'master model',
                ),
                Text(
                  'counter 1 model',
                ),
                Text(
                  '${model.counter1model.counter1}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  'counter 2 model',
                ),
                Text(
                  '${model.counter2model.counter2}',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  '----------------------------------------',
                ),
                Text(
                  'counter 1 model',
                ),
                Text(
                  '${counter1model.counter1}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // builder: (BuildContext context, MasterModel model, Widget child)から再描画
              model.incrementCounter();

              // Widget build(BuildContext context)から再描画
              // (listen: trueの時 かつ notifyListeners() を実行した時)
              counter1model.incrementCounter();

              // master_modelがnotifyListeners()を実行せずに、
              // master_modelの変数にあるChangeNotifierを継承したモデルが
              // notifyListeners()を実行しても、再描画されない
              // ただし、master_modelのsetModel()時のlistenがtrueの時は、再描画される
              //
              // master_modelのcounter1modelのlistenがtrueでも、
              // final counter1model = Provider.of<Counter1Model>(context, listen: false);の時は,
              // Widget build(BuildContext context)から再描画されない
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
