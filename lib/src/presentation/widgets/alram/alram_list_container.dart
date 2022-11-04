import 'package:flutter/material.dart';
import 'package:studimer/src/core/common/provider_consumer.dart';
import 'package:studimer/src/core/resources/type.dart';

import 'alram_list.dart';

class AlramListContainer extends StatelessWidget {
  const AlramListContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CycleOptionPrvdConsumer(
      builder: (context, provider) => provider.focusOn == FocusNum.notice
          ? AlramList(initValue: provider.oneCycle.alram!)
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
                  child: Text(provider.oneCycle.alram!.alramName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)))),
    );
  }
}
