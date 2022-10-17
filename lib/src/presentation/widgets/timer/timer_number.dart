import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TimerNumber extends StatelessWidget {
  const TimerNumber({Key? key, required this.counter}) : super(key: key);
  final int counter;
  @override
  Widget build(BuildContext context) {
    return Text('$counter');
  }
}
