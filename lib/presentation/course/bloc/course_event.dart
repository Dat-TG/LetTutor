part of 'course_bloc.dart';

sealed class CourseEvent extends Equatable {
  const CourseEvent();

  @override
  List<Object> get props => [];
}

final class CourseFetching extends CourseEvent {
  final GetListCoursesUsecaseParams params;
  const CourseFetching({required this.params});
}
