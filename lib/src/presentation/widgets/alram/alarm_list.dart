import 'package:flutter/material.dart';
import 'package:studimer/src/core/common/provider_listen_false.dart';
import 'package:studimer/src/core/resources/type.dart';
import 'package:studimer/src/data/models/internal/alarm.dart';

class AlarmList extends StatelessWidget {
  const AlarmList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final provider = cycleOptionProviderOf(context);
    return Container(
        height: 250,
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            ...Alarm.noticeList
                .map<Widget>((e) => Container(
                    margin: const EdgeInsets.all(5),
                    child: ElevatedButton(
                        onPressed: () {
                          provider.setAlarm(e);
                          provider.setFocusOn(FocusNum.none);
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size.fromHeight(50),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blueGrey[400]),
                        child: Text(
                          e.alarmName,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ))))
                .toList(),
            Container(
                margin: const EdgeInsets.all(5),
                child: ElevatedButton(
                    onPressed: () => provider.setFocusOn(FocusNum.none),
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromHeight(50),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueGrey[400]),
                    child: const Text(
                      '뒤로 가기',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )))
          ],
        ));
  }
}
