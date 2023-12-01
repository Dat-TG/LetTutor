import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/upcoming_lesson/upcoming_lesson_entity.dart';

abstract class UpcomingLessonRepository {
  Future<DataState<UpcomingLessonEntity?>> getUpcomingLesson({
    required String token,
  });
}
