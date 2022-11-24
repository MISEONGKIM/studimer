import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:studimer/src/core/common/provider_consumer.dart';
import 'package:studimer/src/core/resources/type.dart';

class RepeatNumberPicker extends StatelessWidget {
  const RepeatNumberPicker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CycleOptionPrvdConsumer(
        builder: (context, provider) => GestureDetector(
            onTap: () {
              provider.setFocusOn(FocusNum.repeat);
            },
            child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: NumberPicker(
                  value: provider.oneCycle.repeat,
                  minValue: 1,
                  maxValue: 10,
                  itemHeight: 30,
                  step: 1,
                  zeroPad: true,
                  haptics: true,
                  textStyle:
                      const TextStyle(color: Colors.blueGrey, fontSize: 17),
                  selectedTextStyle:
                      const TextStyle(color: Colors.amberAccent, fontSize: 17),
                  onChanged: (value) => provider.setRepeat(value),
                  infiniteLoop: true,
                ))));
  }
}
