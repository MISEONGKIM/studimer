import 'package:flutter/material.dart';
import 'package:studimer/src/presentation/widgets/timer/timer_widget.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('곰스터디머'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            TimerWidget(
              title: '공부 시간',
            ),
            TimerWidget(title: '쉬는 시간')
          ],
        ),
      ),
    );
  }
}
