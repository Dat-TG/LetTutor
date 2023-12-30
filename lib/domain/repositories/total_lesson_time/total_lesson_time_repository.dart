import 'package:let_tutor/core/resources/data_state.dart';

abstract class TotalLessonTimeRepository {
  Future<DataState<int>> getTotalLessonTime();
}
