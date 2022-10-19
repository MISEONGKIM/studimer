import 'package:flutter/material.dart';
import 'package:studimer/src/core/common/provider_consumer.dart';
import 'package:studimer/src/core/resources/type.dart';

import 'notice_list.dart';

class NoticeListContainer extends StatelessWidget {
  const NoticeListContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CycleOptionPrvdConsumer(
      builder: (context, provider) => provider.focusOn == FocusNum.notice
          ? NoticeList(initValue: provider.oneCycle.notice!)
          : Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(7),
              ),
              child: GestureDetector(
                  onTap: () {
                    provider.setFocusOn(FocusNum.notice);
                  },
                  child: Text(provider.oneCycle.notice!.noticeName))),
    );
  }
}
