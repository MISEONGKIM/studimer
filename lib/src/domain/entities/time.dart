import 'package:equatable/equatable.dart';

class Time extends Equatable {
  final int hour;
  final int minuate;
  final int second;

  const Time({required this.hour, required this.minuate, required this.second});

  @override
  List<Object?> get props => [hour, minuate, second];
}
