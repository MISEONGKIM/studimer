import 'package:studimer/src/core/resources/type.dart';
import 'package:vibration/vibration.dart';

class Alram {
  final NoticeType alramCode;
  final String alramName;
  final bool isUse;
  static List<Alram> noticeList = [
    const Alram(alramCode: NoticeType.vivration, alramName: '진동', isUse: true),
    const Alram(alramCode: NoticeType.sounds, alramName: '소리', isUse: false),
    const Alram(alramCode: NoticeType.message, alramName: '알림', isUse: false)
  ];

  const Alram(
      {required this.alramCode, required this.alramName, required this.isUse});

  startAlram() async {
    Vibration.vibrate(repeat: 100);
  }

  stopAlram() async {
    Vibration.cancel();
  }
}
