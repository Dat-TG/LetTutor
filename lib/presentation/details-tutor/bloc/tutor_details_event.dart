part of 'tutor_details_bloc.dart';

sealed class TutorDetailsEvent extends Equatable {
  const TutorDetailsEvent();

  @override
  List<Object> get props => [];
}

final class TutorDetailsLoad extends TutorDetailsEvent {
  final String token;
  final String tutorId;

  const TutorDetailsLoad(this.token, this.tutorId);
}
