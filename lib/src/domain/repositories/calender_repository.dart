import 'package:studimer/src/core/params/calender_request.dart';
import 'package:studimer/src/core/resources/data_state.dart';

import '../entities/calender.dart';

abstract class CalenderRepository {
  Future<DataState<List<Calender>>> getCalenderOneMonth(
      CalenderRequestParams params);
}
