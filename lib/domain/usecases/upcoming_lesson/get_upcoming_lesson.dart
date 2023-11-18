import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/entities/upcoming_lesson/upcoming_lesson_entity.dart';
import 'package:let_tutor/domain/repositories/upcoming_lesson/upcoming_lesson_repository.dart';

class GetUpcomingLessonUsecase
    implements UseCase<DataState<UpcomingLessonEntity>, String> {
  final UpcomingLessonRepository _upcomingLessonRepository;
  GetUpcomingLessonUsecase(this._upcomingLessonRepository);

  @override
  Future<DataState<UpcomingLessonEntity>> call({String? params}) {
    return _upcomingLessonRepository.getUpcomingLesson(token: params ?? "");
  }
}
