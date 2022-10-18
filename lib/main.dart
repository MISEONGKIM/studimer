import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studimer/src/core/utils/constants.dart';
import 'package:studimer/src/presentation/providers/cycle_option_provider.dart';
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
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      title: kMaterialAppTitle,
      home: ChangeNotifierProvider(
          create: (_) => CycleOptionProvider(), child: const MainView()),
    );
  }
}
