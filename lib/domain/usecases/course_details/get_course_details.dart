import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/entities/course_details/course_details_entity.dart';
import 'package:let_tutor/domain/repositories/course_details/course_details_repository.dart';

class GetCourseDetailsUsecase
    implements
        UseCase<DataState<CourseDetailsEntity>, GetCourseDetailsUsecaseParams> {
  final CourseDetailsRepository _courseDetailsRepository;
  GetCourseDetailsUsecase(this._courseDetailsRepository);

  @override
  Future<DataState<CourseDetailsEntity>> call(
      {GetCourseDetailsUsecaseParams? params}) {
    return _courseDetailsRepository.getCourseDetails(
      token: params!.token,
      courseId: params.courseId,
    );
  }
}

class GetCourseDetailsUsecaseParams {
  final String token;
  final String courseId;

  GetCourseDetailsUsecaseParams({
    required this.token,
    required this.courseId,
  });

  GetCourseDetailsUsecaseParams copyWith({
    String? token,
    String? courseId,
  }) {
    return GetCourseDetailsUsecaseParams(
      token: token ?? this.token,
      courseId: courseId ?? this.courseId,
    );
  }
}
