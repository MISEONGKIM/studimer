import 'package:flutter/material.dart';

import 'repeat_container.dart';

class RepeatWidget extends StatelessWidget {
  const RepeatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(3),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                '반복 횟수',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              RepeatContainer()
            ]));
  }
}
