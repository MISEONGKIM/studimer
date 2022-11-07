import 'package:flutter/material.dart';

import 'alarm_list_container.dart';

class AlarmWidget extends StatelessWidget {
  const AlarmWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(3),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                '알람 타입',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              AlarmListContainer(),
            ]));
  }
}
