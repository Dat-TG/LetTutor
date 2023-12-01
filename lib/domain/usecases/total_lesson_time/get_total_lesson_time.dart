import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/repositories/total_lesson_time/total_lesson_time_repository.dart';

class GetTotalLessonTimeUsecase implements UseCase<DataState<int>, String> {
  final TotalLessonTimeRepository _totalLessonTimeRepository;
  GetTotalLessonTimeUsecase(this._totalLessonTimeRepository);

  @override
  Future<DataState<int>> call({String? params}) {
    return _totalLessonTimeRepository.getTotalLessonTime(token: params ?? "");
  }
}
