import 'package:flutter/material.dart';
import 'package:studimer/src/core/common/provider_consumer.dart';
import 'package:studimer/src/core/resources/type.dart';

class RepeatTextField extends StatelessWidget {
  RepeatTextField({Key? key}) : super(key: key);
  final FocusNode _focus = FocusNode();
  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, dynamic provider) {
    currentFocus.unfocus();
    provider.setFocusOn(FocusNum.none);
  }

  @override
  Widget build(BuildContext context) {
    return CycleOptionPrvdConsumer(
        builder: (context, provider) => SizedBox(
            width: 100,
            child: TextFormField(
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (term) {
                _fieldFocusChange(context, _focus, provider);
              },
              onTap: () {
                provider.setFocusOn(FocusNum.repeat);
              },
              initialValue: provider.oneCycle.repeat.toString(),
              onChanged: (value) => provider.setRepeat(int.parse(value)),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
            )));
  }
}
