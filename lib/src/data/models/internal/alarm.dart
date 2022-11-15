import 'dart:async';

import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:studimer/src/core/resources/type.dart';
import 'package:vibration/vibration.dart';

class Alarm {
  final NoticeType alarmCode;
  final String alarmName;
  final bool isUse;
  late Timer vibrationTimer;
  static List<Alarm> noticeList = [
    Alarm(alarmCode: NoticeType.vivration, alarmName: '진동', isUse: true),
    Alarm(alarmCode: NoticeType.sounds, alarmName: '소리', isUse: false)
  ];

  Alarm(
      {required this.alarmCode, required this.alarmName, required this.isUse});

  void _startOneMinuateVibrate() {
    int second = 60;
    vibrationTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      second -= 1;
      Vibration.vibrate(pattern: [500, 1000]);
      if (second == 0) {
        timer.cancel();
      }
    });
  }

  void startAlarm(NoticeType type) async {
    type == NoticeType.vivration
        ? _startOneMinuateVibrate()
        : FlutterRingtonePlayer.playAlarm();
  }

  void stopAlarm(NoticeType type) async {
    if (type == NoticeType.vivration) {
      Vibration.cancel();
      vibrationTimer.cancel();
      return;
    }
    FlutterRingtonePlayer.stop();
  }
}
