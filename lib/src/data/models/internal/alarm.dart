import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:studimer/src/core/resources/type.dart';
import 'package:vibration/vibration.dart';

class Alarm {
  final NoticeType alarmCode;
  final String alarmName;
  final bool isUse;
  static List<Alarm> noticeList = [
    const Alarm(alarmCode: NoticeType.vivration, alarmName: '진동', isUse: true),
    const Alarm(alarmCode: NoticeType.sounds, alarmName: '소리', isUse: false)
  ];

  const Alarm(
      {required this.alarmCode, required this.alarmName, required this.isUse});

  startAlarm(NoticeType type) async {
    type == NoticeType.vivration
        ? Vibration.vibrate(duration: 1000, amplitude: 1)
        : FlutterRingtonePlayer.playAlarm();
  }

  stopAlarm(NoticeType type) async {
    type == NoticeType.vivration
        ? Vibration.cancel()
        : FlutterRingtonePlayer.stop();
  }
}
