part of 'tutor_bloc.dart';

abstract class TutorState extends Equatable {
  final int? page;
  final List<TutorEntity>? tutors;
  final DioException? error;
  const TutorState({
    this.tutors,
    this.error,
    this.page,
  });

  @override
  List<Object?> get props => [tutors, error, page];
}

final class TutorSearchInProgress extends TutorState {
  const TutorSearchInProgress(List<TutorEntity> tutors, int page)
      : super(tutors: tutors, page: page);
}

final class TutorSearchSuccess extends TutorState {
  const TutorSearchSuccess(List<TutorEntity> tutors, int page)
      : super(tutors: tutors, page: page);
}

final class TutorSearchFailure extends TutorState {
  const TutorSearchFailure(DioException error) : super(error: error);
}

final class TutorNotFound extends TutorState {
  const TutorNotFound(List<TutorEntity> tutors, int page)
      : super(tutors: tutors, page: page);
}
