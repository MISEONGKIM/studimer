import 'package:flutter/material.dart';
import 'package:studimer/src/core/utils/constants.dart';
import 'package:studimer/src/presentation/views/main_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kMaterialAppTitle,
      theme: ThemeData(
          backgroundColor: Colors.black, colorSchemeSeed: Colors.amber[50]),
      home: const MainView(),
    );
  }
}
