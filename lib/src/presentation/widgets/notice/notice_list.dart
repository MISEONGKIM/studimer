import 'package:flutter/material.dart';
import 'package:studimer/src/data/models/internal/notice.dart';

class NoticeList extends StatelessWidget {
  const NoticeList({Key? key, required this.initValue}) : super(key: key);
  final Notice initValue;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: Notice.noticeList
              .map<Widget>((e) => ElevatedButton(
                  onPressed: () {},
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
        ));
  }
}
