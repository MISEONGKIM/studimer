import 'package:flutter/material.dart';
import 'package:studimer/src/core/common/provider_consumer.dart';

class StartButton extends StatelessWidget {
  const StartButton({Key? key, required this.onPressed}) : super(key: key);
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return CycleOptionPrvdConsumer(
        builder: (context, provider) => ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20),
                disabledBackgroundColor: Colors.grey,
                foregroundColor: Colors.white,
                textStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                backgroundColor: Colors.green[600]),
            onPressed: provider.isTimerBtnDisabled ? null : () => onPressed(),
            child: const Text('You Can Do It !')));
  }
}
