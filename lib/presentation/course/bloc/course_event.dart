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

final class CourseUpdateLevel extends CourseEvent {
  final List<MapEntry<int, String>> level;
  const CourseUpdateLevel({required this.level});
}

final class CourseUpdateOrder extends CourseEvent {
  final String order;
  const CourseUpdateOrder({required this.order});
}

final class CourseUpdateCategoryId extends CourseEvent {
  final List<MapEntry<String, String>> categoryId;
  const CourseUpdateCategoryId({required this.categoryId});
}
