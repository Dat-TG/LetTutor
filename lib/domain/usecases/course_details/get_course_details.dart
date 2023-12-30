import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/entities/course_details/course_details_entity.dart';
import 'package:let_tutor/domain/repositories/course_details/course_details_repository.dart';

class GetCourseDetailsUsecase
    implements UseCase<DataState<CourseDetailsEntity>, String> {
  final CourseDetailsRepository _courseDetailsRepository;
  GetCourseDetailsUsecase(this._courseDetailsRepository);

  @override
  Future<DataState<CourseDetailsEntity>> call({String? params}) {
    return _courseDetailsRepository.getCourseDetails(
      courseId: params!,
    );
  }
}
