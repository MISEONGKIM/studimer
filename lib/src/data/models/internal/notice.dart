import 'package:studimer/src/core/resources/type.dart';

class Notice {
  final NoticeType noticeCode;
  final String noticeName;
  final bool isUse;
  static List<Notice> noticeList = [
    const Notice(
        noticeCode: NoticeType.vivration, noticeName: '진동', isUse: true),
    const Notice(noticeCode: NoticeType.sounds, noticeName: '소리', isUse: false),
    const Notice(noticeCode: NoticeType.message, noticeName: '알림', isUse: false)
  ];

  const Notice(
      {required this.noticeCode,
      required this.noticeName,
      required this.isUse});
}
