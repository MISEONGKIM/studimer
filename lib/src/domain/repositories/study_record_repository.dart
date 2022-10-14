import 'package:studimer/src/core/params/study_record_request.dart';
import 'package:studimer/src/core/resources/data_state.dart';

import '../entities/study_record.dart';

abstract class StudyRecordRepository {
  Future<DataState<List<StudyRecord>>> getStudyRecordByMonth(
      GetStudyRecordRequestParams params);

  Future<void> saveStudyRecord(SaveStudyRecordRequestParams record);
}