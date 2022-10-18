class Notice {
  final int noticeCode;
  final String noticeName;
  final bool isUse;
  static List<Notice> noticeList = [
    const Notice(noticeCode: 0, noticeName: '진동', isUse: true),
    const Notice(noticeCode: 1, noticeName: '소리', isUse: false),
    const Notice(noticeCode: 2, noticeName: '알림', isUse: false)
  ];

  const Notice(
      {required this.noticeCode,
      required this.noticeName,
      required this.isUse});
}
