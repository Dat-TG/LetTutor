part of 'tutor_bloc.dart';

abstract class TutorState extends Equatable {
  final List<TutorEntity>? tutors;
  final DioException? error;
  const TutorState({this.tutors, this.error});

  @override
  List<Object?> get props => [tutors, error];
}

final class TutorSearchInProgress extends TutorState {
  const TutorSearchInProgress();
}

final class TutorSearchSuccess extends TutorState {
  const TutorSearchSuccess(List<TutorEntity> tutors) : super(tutors: tutors);
}

final class TutorSearchFailure extends TutorState {
  const TutorSearchFailure(DioException error) : super(error: error);
}
