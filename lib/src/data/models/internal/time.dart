import 'package:equatable/equatable.dart';

class Time extends Equatable {
  final int hour;
  final int minuate;
  final int second;
  static Time get init => const Time(hour: 0, minuate: 0, second: 0);
  const Time({required this.hour, required this.minuate, required this.second});

  @override
  List<Object?> get props => [hour, minuate, second];
}
