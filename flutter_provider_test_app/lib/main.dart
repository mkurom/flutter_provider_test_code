import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_provider_test_app/home.dart';

import 'package:flutter_provider_test_app/models/master_mode.dart';
import 'package:flutter_provider_test_app/models/counter1_model.dart';
import 'package:flutter_provider_test_app/models/counter2_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MasterModel>(
          create: (_) => MasterModel(),
        ),
        ChangeNotifierProvider<Counter1Model>(
          create: (_) => Counter1Model(),
        ),
        ChangeNotifierProvider<Counter2Model>(
          create: (_) => Counter2Model(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
