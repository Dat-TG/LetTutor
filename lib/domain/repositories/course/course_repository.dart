import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/course/course_entity.dart';

abstract class CourseRepository {
  Future<DataState<List<CourseEntity>>> getListCourses({
    required String token,
    required int page,
    required int size,
  });
}
