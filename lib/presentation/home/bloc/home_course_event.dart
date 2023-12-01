part of 'home_course_bloc.dart';

sealed class HomeCourseEvent extends Equatable {
  const HomeCourseEvent();

  @override
  List<Object> get props => [];
}

final class FetchCourse extends HomeCourseEvent {
  const FetchCourse();
}
