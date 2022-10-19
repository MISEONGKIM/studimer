import 'package:flutter/cupertino.dart';
import 'package:studimer/src/core/common/provider_consumer.dart';

class NoticeListContainer extends StatelessWidget {
  const NoticeListContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CycleOptionPrvdConsumer(
        builder: (context, provider) => GestureDetector(
              child: Text(provider.oneCycle.notice!.noticeName),
            ));
  }
}
