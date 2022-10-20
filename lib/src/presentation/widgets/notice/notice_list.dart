import 'package:flutter/material.dart';
import 'package:studimer/src/core/common/provider_listen_false.dart';
import 'package:studimer/src/core/resources/type.dart';
import 'package:studimer/src/data/models/internal/notice.dart';

class NoticeList extends StatelessWidget {
  const NoticeList({Key? key, required this.initValue}) : super(key: key);
  final Notice initValue;
  @override
  Widget build(BuildContext context) {
    final provider = cycleOptionProvider(context);
    return Container(
        height: 250,
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            ...Notice.noticeList
                .map<Widget>((e) => ElevatedButton(
                    onPressed: () {
                      provider.setNotice(e);
                      provider.setFocusOn(FocusNum.none);
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromHeight(50),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueGrey[400]),
                    child: Text(
                      e.noticeName,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )))
                .toList(),
            ElevatedButton(
                onPressed: () => provider.setFocusOn(FocusNum.none),
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromHeight(50),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blueGrey[400]),
                child: const Text(
                  '뒤로 가기',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ))
          ],
        ));
  }
}
