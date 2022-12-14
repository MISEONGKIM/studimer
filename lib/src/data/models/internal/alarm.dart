import 'dart:async';

import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:studimer/src/core/resources/type.dart';
import 'package:vibration/vibration.dart';

class Alarm {
  final NoticeType alarmCode;
  final String alarmName;
  late Timer vibrationTimer;
  static List<Alarm> noticeList = [
    Alarm(alarmCode: NoticeType.vivration, alarmName: '진동'),
    Alarm(alarmCode: NoticeType.sounds, alarmName: '소리')
  ];

  Alarm({required this.alarmCode, required this.alarmName});

  void _startOneMinuateVibrate() {
    int seconds = 30;
    vibrationTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      seconds -= 1;
      Vibration.vibrate(pattern: [500, 1000]);
      if (seconds == 0) {
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
