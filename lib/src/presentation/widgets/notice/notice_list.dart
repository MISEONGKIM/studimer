import 'package:flutter/material.dart';
import 'package:studimer/src/data/models/internal/notice.dart';

class NoticeList extends StatelessWidget {
  const NoticeList({Key? key, required this.initValue}) : super(key: key);
  final Notice initValue;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: Notice.noticeList
          .map<Widget>((e) => Card(child: Text(e.noticeName)))
          .toList(),
    );
  }
}
