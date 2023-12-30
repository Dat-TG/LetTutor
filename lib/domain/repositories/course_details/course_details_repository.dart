import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/course_details/course_details_entity.dart';

abstract class CourseDetailsRepository {
  Future<DataState<CourseDetailsEntity>> getCourseDetails({
    required String courseId,
  });
}
