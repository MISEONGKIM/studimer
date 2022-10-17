import 'package:studimer/src/data/datasources/local/app_database.dart';
import 'package:studimer/src/domain/entities/study_record.dart';
import 'package:studimer/src/core/params/study_record_request.dart';
import 'package:studimer/src/domain/repositories/study_record_repository.dart';

class StudyRecordRepositoryImpl implements StudyRecordRepository {
  final AppDatabase _appDatabase;

  const StudyRecordRepositoryImpl(this._appDatabase);

  @override
  Future<List<StudyRecord>> getStudyRecordByMonth(
      GetStudyRecordRequestParams params) {
    return _appDatabase.studyRecordDao
        .getStudyRecordByMonth(params.startTime, params.endTime);
  }

  @override
  Future<void> saveStudyRecord(SaveStudyRecordRequestParams record) {
    return _appDatabase.studyRecordDao.insertStudyRecord(record.studyRecord);
  }
}
