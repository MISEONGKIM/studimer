import 'package:floor/floor.dart';
import 'package:studimer/src/core/utils/constants.dart';

@Entity(tableName: kStudimerTableName)
class StudyRecord {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final int cycleRepeat;
  final String regTime;

  const StudyRecord(this.id,
      {required this.regTime, required this.cycleRepeat});
}
