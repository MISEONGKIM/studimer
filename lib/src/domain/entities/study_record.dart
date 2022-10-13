import 'package:equatable/equatable.dart';

class StudyRecord extends Equatable {
  final String day;
  final int cycleRepeat;

  const StudyRecord({required this.day, required this.cycleRepeat});

  @override
  List<Object?> get props => [day, cycleRepeat];
}
