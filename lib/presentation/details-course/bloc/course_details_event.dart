part of 'course_details_bloc.dart';

sealed class CourseDetailsEvent extends Equatable {
  const CourseDetailsEvent();

  @override
  List<Object> get props => [];
}

final class CourseDetailsFetching extends CourseDetailsEvent {
  final String courseId;
  const CourseDetailsFetching({required this.courseId});
}
