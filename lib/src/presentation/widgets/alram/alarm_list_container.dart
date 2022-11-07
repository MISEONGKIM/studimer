import 'package:flutter/material.dart';
import 'package:studimer/src/core/common/provider_consumer.dart';
import 'package:studimer/src/core/resources/type.dart';

import 'alarm_list.dart';

class AlarmListContainer extends StatelessWidget {
  const AlarmListContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CycleOptionPrvdConsumer(
      builder: (context, provider) => provider.focusOn == FocusNum.notice
          ? AlarmList(initValue: provider.oneCycle.alarm!)
          : GestureDetector(
              onTap: () {
                provider.setFocusOn(FocusNum.notice);
              },
              child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text(provider.oneCycle.alarm!.alarmName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)))),
    );
  }
}
