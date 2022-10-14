import 'package:studimer/src/core/params/study_record_request.dart';
import 'package:studimer/src/core/usecases/usecase.dart';
import 'package:studimer/src/domain/entities/study_record.dart';
import 'package:studimer/src/domain/repositories/study_record_repository.dart';

class SaveStudyRecordUseCase
    implements UseCase<void, SaveStudyRecordRequestParams> {
  final StudyRecordRepository _studyRecordRepository;

  SaveStudyRecordUseCase(this._studyRecordRepository);

  @override
  Future<void> call({SaveStudyRecordRequestParams? params}) {
    return _studyRecordRepository.saveStudyRecord(params!);
  }
}
