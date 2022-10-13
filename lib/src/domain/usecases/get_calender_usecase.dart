import 'package:studimer/src/core/params/calender_request.dart';
import 'package:studimer/src/core/resources/data_state.dart';
import 'package:studimer/src/core/usecases/usecase.dart';
import 'package:studimer/src/domain/entities/calender.dart';
import 'package:studimer/src/domain/repositories/calender_repository.dart';

class GetCalenderUseCase
    implements UseCase<DataState<List<Calender>>, CalenderRequestParams> {
  final CalenderRepository _calenderRepository;

//repository 생성해서 사용하는 게 아닌 주입받아서 사용 !
  GetCalenderUseCase(this._calenderRepository);

  @override
  Future<DataState<List<Calender>>> call({CalenderRequestParams? params}) {
    return _calenderRepository.getCalenderOneMonth(params!);
  }
}
