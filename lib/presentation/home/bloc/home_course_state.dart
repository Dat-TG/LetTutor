part of 'home_course_bloc.dart';

sealed class HomeCourseState extends Equatable {
  final List<CourseEntity>? courses;
  final DioException? error;
  const HomeCourseState({
    this.courses,
    this.error,
  });

  @override
  List<Object?> get props => [courses, error];
}

final class CourseFetching extends HomeCourseState {
  const CourseFetching();
}

final class CourseFetched extends HomeCourseState {
  const CourseFetched({
    required List<CourseEntity> courses,
  }) : super(courses: courses);
}

final class CourseError extends HomeCourseState {
  const CourseError({
    required DioException error,
  }) : super(error: error);
}
