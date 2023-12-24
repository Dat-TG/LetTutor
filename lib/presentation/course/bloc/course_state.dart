part of 'course_bloc.dart';

sealed class CourseState extends Equatable {
  final List<CourseEntity>? courses;
  final GetListCoursesUsecaseParams? params;
  final DioException? error;
  const CourseState({
    this.courses,
    this.error,
    this.params,
  });

  @override
  List<Object?> get props => [courses, error, params];
}

final class CourseLoading extends CourseState {
  const CourseLoading({
    List<CourseEntity>? courses,
    GetListCoursesUsecaseParams? params,
    DioException? error,
  }) : super(
          courses: courses,
          params: params,
          error: error,
        );
}

final class CourseDone extends CourseState {
  const CourseDone({
    List<CourseEntity>? courses,
    GetListCoursesUsecaseParams? params,
    DioException? error,
  }) : super(
          courses: courses,
          params: params,
          error: error,
        );
}

final class CourseNotFound extends CourseState {
  const CourseNotFound({
    List<CourseEntity>? courses,
    GetListCoursesUsecaseParams? params,
    DioException? error,
  }) : super(
          courses: courses,
          params: params,
          error: error,
        );
}

final class CourseFailed extends CourseState {
  const CourseFailed({
    List<CourseEntity>? courses,
    GetListCoursesUsecaseParams? params,
    DioException? error,
  }) : super(
          courses: courses,
          params: params,
          error: error,
        );
}

final class CourseCompleted extends CourseState {
  const CourseCompleted({
    List<CourseEntity>? courses,
    GetListCoursesUsecaseParams? params,
    DioException? error,
  }) : super(
          courses: courses,
          params: params,
          error: error,
        );
}
