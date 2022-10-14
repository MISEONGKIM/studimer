import 'package:studimer/src/domain/entities/study_record.dart';

class GetStudyRecordRequestParams {
  final String startTime;
  final String endTime;

  const GetStudyRecordRequestParams(
      {required this.startTime, required this.endTime});
}

class SaveStudyRecordRequestParams {
  final StudyRecord studyRecord;

  const SaveStudyRecordRequestParams({required this.studyRecord});
}
