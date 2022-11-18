import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studimer/src/core/resources/type.dart';
import 'package:studimer/src/core/utils/constants.dart';
import 'package:studimer/src/data/models/internal/backgound_service.dart';
import 'package:studimer/src/presentation/providers/cycle_option_provider.dart';
import 'package:studimer/src/presentation/providers/timer_provider.dart';
import 'package:studimer/src/presentation/views/main_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BackGroundService.initBackGroundService();
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
              if (cProvider.timerStatus == TimerStatus.cancel) {
                tProvider!.setTime = cProvider.setStudyTime;
                tProvider.t.durationConvert(cProvider.oneCycle.studyTime);
              }
              return tProvider!;
            }),
        ChangeNotifierProxyProvider<CycleOptionProvider, RestTimerProvider>(
            create: (BuildContext context) => RestTimerProvider(),
            update: (BuildContext context, CycleOptionProvider cProvider,
                RestTimerProvider? tProvider) {
              if (cProvider.timerStatus == TimerStatus.cancel) {
                tProvider!.setTime = cProvider.setRestTime;
                tProvider.t.durationConvert(cProvider.oneCycle.restTime);
              }
              return tProvider!;
            }),
      ], child: const MainView()),
    );
  }
}
