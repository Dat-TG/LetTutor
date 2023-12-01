import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/entities/course/course_entity.dart';
import 'package:let_tutor/domain/repositories/course/course_repository.dart';

class GetListCoursesUsecase
    implements
        UseCase<DataState<List<CourseEntity>>, GetListCoursesUsecaseParams> {
  final CourseRepository _courseRepository;
  GetListCoursesUsecase(this._courseRepository);

  @override
  Future<DataState<List<CourseEntity>>> call(
      {GetListCoursesUsecaseParams? params}) {
    return _courseRepository.getListCourses(
      token: params!.token,
      page: params.page,
      size: params.size,
    );
  }
}

class GetListCoursesUsecaseParams {
  final String token;
  final int page;
  final int size;

  GetListCoursesUsecaseParams({
    required this.token,
    required this.page,
    required this.size,
  });

  GetListCoursesUsecaseParams copyWith({
    String? token,
    int? page,
    int? size,
  }) {
    return GetListCoursesUsecaseParams(
      token: token ?? this.token,
      page: page ?? 1,
      size: size ?? 5,
    );
  }
}
