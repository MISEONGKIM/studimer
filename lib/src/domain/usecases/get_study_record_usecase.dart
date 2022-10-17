import 'package:studimer/src/core/params/study_record_request.dart';
import 'package:studimer/src/core/usecases/usecase.dart';
import 'package:studimer/src/domain/entities/study_record.dart';
import 'package:studimer/src/domain/repositories/study_record_repository.dart';

class GetStudyRecordUseCase
    implements UseCase<List<StudyRecord>, GetStudyRecordRequestParams> {
  final StudyRecordRepository _studyRecordRepository;

//repository 생성해서 사용하는 게 아닌 주입받아서 사용 !
  GetStudyRecordUseCase(this._studyRecordRepository);

  @override
  Future<List<StudyRecord>> call({GetStudyRecordRequestParams? params}) {
    return _studyRecordRepository.getStudyRecordByMonth(params!);
  }
}
