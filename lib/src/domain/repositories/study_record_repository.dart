import 'package:studimer/src/core/params/study_record_request.dart';
import '../entities/study_record.dart';

abstract class StudyRecordRepository {
  Future<List<StudyRecord>> getStudyRecordByMonth(
      GetStudyRecordRequestParams params);

  Future<void> saveStudyRecord(SaveStudyRecordRequestParams record);
}
