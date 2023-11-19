part of 'course_bloc.dart';

sealed class CourseEvent extends Equatable {
  const CourseEvent();

  @override
  List<Object> get props => [];
}

final class CourseSearch extends CourseEvent {
  final GetListCoursesUsecaseParams params;
  const CourseSearch({required this.params});
}
