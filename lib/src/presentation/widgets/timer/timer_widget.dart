import 'package:flutter/material.dart';
import 'package:studimer/src/presentation/widgets/timer/timer_number_container.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    final isTimerStart = false;
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(children: [
                TimerNumberContainer(
                  isTimerStart: isTimerStart,
                  maxValueForPicker: 12,
                ),
                TimerNumberContainer(
                  isTimerStart: isTimerStart,
                ),
                TimerNumberContainer(
                  isTimerStart: isTimerStart,
                )
              ]))
        ]));
  }
}
