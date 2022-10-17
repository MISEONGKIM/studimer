import 'package:studimer/src/domain/entities/study_record.dart';

class StudyRecordModel extends StudyRecord {
  const StudyRecordModel(
      {required int id, required int cycleRepeat, required String regTime})
      : super(id, cycleRepeat: cycleRepeat, regTime: regTime);
  factory StudyRecordModel.fromJson(Map<String, dynamic> map) {
    return StudyRecordModel(
        id: map['id'] as int,
        cycleRepeat: map['cycleRepeat'] as int,
        regTime: map['regTime'] as String);
  }
}
