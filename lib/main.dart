import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studimer/src/core/utils/constants.dart';
import 'package:studimer/src/presentation/providers/cycle_option_provider.dart';
import 'package:studimer/src/presentation/providers/timer_provider.dart';
import 'package:studimer/src/presentation/views/main_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      title: kMaterialAppTitle,
      home: MultiProvider(providers: [
        ChangeNotifierProvider<CycleOptionProvider>(
          create: (_) => CycleOptionProvider(),
        ),
        ChangeNotifierProxyProvider<CycleOptionProvider, StudyTimerProvider>(
            create: (BuildContext context) => StudyTimerProvider(),
            update: (BuildContext context, CycleOptionProvider cProvider,
                StudyTimerProvider? tProvider) {
              tProvider!.setTime = cProvider.setRestTime;
              return tProvider;
            }),
        ChangeNotifierProxyProvider<CycleOptionProvider, RestTimerProvider>(
            create: (BuildContext context) => RestTimerProvider(),
            update: (BuildContext context, CycleOptionProvider cProvider,
                RestTimerProvider? tProvider) {
              tProvider!.setTime = cProvider.setRestTime;
              return tProvider;
            }),
      ], child: const MainView()),
    );
  }
}
