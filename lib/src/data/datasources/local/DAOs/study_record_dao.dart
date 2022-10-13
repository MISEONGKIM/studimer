import 'package:floor/floor.dart';
import 'package:studimer/src/core/utils/constants.dart';
import 'package:studimer/src/domain/entities/study_record.dart';

@dao
abstract class StudyRecordDao {
  @Query(
      'SELECT * FROM $kStudimerTableName Where regTime BETWEEN :startTime AND :endTime')
  Future<List<StudyRecord>> getStudyRecordByMonth(
      String startTime, String endTime);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertStudyRecord(StudyRecord record);
}
