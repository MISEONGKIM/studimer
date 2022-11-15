import 'package:flutter/material.dart';
import 'package:studimer/src/core/common/provider_consumer.dart';
import 'package:studimer/src/core/resources/type.dart';

import 'repeat_text.dart';
import 'repeat_textfield.dart';

class RepeatContainer extends StatelessWidget {
  const RepeatContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CycleOptionPrvdConsumer(
        builder: (context, provider) => provider.focusOn == FocusNum.repeat
            ? RepeatTextField(provider: provider)
            : GestureDetector(
                onTap: () {
                  provider.setFocusOn(FocusNum.repeat);
                },
                child: RepeatText(provider: provider)));
  }
}
