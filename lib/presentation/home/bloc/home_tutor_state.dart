part of 'home_tutor_bloc.dart';

sealed class HomeTutorState extends Equatable {
  final List<TutorEntity>? tutors;
  final DioException? error;
  const HomeTutorState({
    this.tutors,
    this.error,
  });

  @override
  List<Object> get props => [];
}

final class TutorFetching extends HomeTutorState {
  const TutorFetching();
}

final class TutorFetched extends HomeTutorState {
  const TutorFetched({
    required List<TutorEntity> tutors,
  }) : super(tutors: tutors);
}

final class TutorError extends HomeTutorState {
  const TutorError({
    required DioException error,
  }) : super(error: error);
}
