import 'package:equatable/equatable.dart';

class Calender extends Equatable {
  final String day;
  final int cycleRepeat;

  const Calender({required this.day, required this.cycleRepeat});

  @override
  List<Object?> get props => [day, cycleRepeat];
}
