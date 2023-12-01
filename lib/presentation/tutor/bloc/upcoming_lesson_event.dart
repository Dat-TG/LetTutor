part of 'upcoming_lesson_bloc.dart';

sealed class UpcomingLessonEvent extends Equatable {
  const UpcomingLessonEvent();

  @override
  List<Object> get props => [];
}

final class UpcomingLessonFetched extends UpcomingLessonEvent {
  const UpcomingLessonFetched();
}
