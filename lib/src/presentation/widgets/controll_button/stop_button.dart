import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studimer/src/core/common/provider_listen_false.dart';
import 'package:studimer/src/presentation/providers/cycle_option_provider.dart';

class StopButton extends StatelessWidget {
  const StopButton({Key? key}) : super(key: key);
  _onPressed(CycleOptionProvider provider) {}

  @override
  Widget build(BuildContext context) {
    final provider = cycleOptionProvider(context);
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
            foregroundColor: Colors.white,
            textStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            backgroundColor: Colors.blueGrey),
        onPressed: () => _onPressed(provider),
        child: const Text('ㅗ'));
  }
}
