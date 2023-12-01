part of 'tutor_details_bloc.dart';

sealed class TutorDetailsState extends Equatable {
  final TutorDetailsEntity? tutorDetails;
  final DioException? error;
  final String? message;
  const TutorDetailsState({this.tutorDetails, this.error, this.message});

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

final class ReportTutorDone extends TutorDetailsState {
  const ReportTutorDone(
      {required String message, required TutorDetailsEntity tutorDetails})
      : super(message: message, tutorDetails: tutorDetails);
}
