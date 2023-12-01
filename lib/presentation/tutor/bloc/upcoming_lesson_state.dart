part of 'upcoming_lesson_bloc.dart';

sealed class UpcomingLessonState extends Equatable {
  final UpcomingLessonEntity? upcomingLesson;
  final DioException? error;
  const UpcomingLessonState({this.upcomingLesson, this.error});

  @override
  List<Object?> get props => [upcomingLesson, error];
}

final class UpcomingLessonLoading extends UpcomingLessonState {
  const UpcomingLessonLoading(UpcomingLessonEntity upcomingLesson)
      : super(upcomingLesson: upcomingLesson);
}

final class UpcomingLessonDone extends UpcomingLessonState {
  const UpcomingLessonDone(UpcomingLessonEntity? upcomingLesson)
      : super(upcomingLesson: upcomingLesson);
}

final class UpcomingLessonFailed extends UpcomingLessonState {
  const UpcomingLessonFailed(DioException error) : super(error: error);
}
