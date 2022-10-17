import 'package:flutter/material.dart';
import 'package:studimer/src/presentation/widgets/timer_widget.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [TimerWidget()],
        ),
      ),
    );
  }
}
