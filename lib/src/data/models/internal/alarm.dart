import 'package:studimer/src/core/resources/type.dart';
import 'package:vibration/vibration.dart';

class Alarm {
  final NoticeType alarmCode;
  final String alarmName;
  final bool isUse;
  static List<Alarm> noticeList = [
    const Alarm(alarmCode: NoticeType.vivration, alarmName: '진동', isUse: true),
    const Alarm(alarmCode: NoticeType.sounds, alarmName: '소리', isUse: false),
    const Alarm(alarmCode: NoticeType.message, alarmName: '알림', isUse: false)
  ];

  const Alarm(
      {required this.alarmCode, required this.alarmName, required this.isUse});

  startAlarm() async {
    Vibration.vibrate(repeat: 100);
  }

  stopAlarm() async {
    Vibration.cancel();
  }
}
