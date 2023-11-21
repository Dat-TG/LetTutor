part of 'tutor_details_bloc.dart';

sealed class TutorDetailsState extends Equatable {
  final TutorDetailsEntity? tutorDetails;
  final DioException? error;
  const TutorDetailsState({this.tutorDetails, this.error});

  @override
  List<Object?> get props => [tutorDetails, error];
}

final class TutorDetailsLoading extends TutorDetailsState {
  const TutorDetailsLoading();
}

final class FavoriteTutorInProcess extends TutorDetailsState {
  const FavoriteTutorInProcess();
}

final class TutorDetailsDone extends TutorDetailsState {
  const TutorDetailsDone(TutorDetailsEntity tutorDetails)
      : super(tutorDetails: tutorDetails);
}

final class TutorDetailsError extends TutorDetailsState {
  const TutorDetailsError(DioException error) : super(error: error);
}
