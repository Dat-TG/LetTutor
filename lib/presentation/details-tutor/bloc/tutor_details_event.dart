part of 'tutor_details_bloc.dart';

sealed class TutorDetailsEvent extends Equatable {
  const TutorDetailsEvent();

  @override
  List<Object> get props => [];
}

final class TutorDetailsLoad extends TutorDetailsEvent {
  final String tutorId;

  const TutorDetailsLoad(this.tutorId);
}

final class FavoriteTutor extends TutorDetailsEvent {
  final String tutorId;
  final BuildContext context;

  const FavoriteTutor(this.tutorId, this.context);
}

final class ReportTutorEvent extends TutorDetailsEvent {
  final String tutorId;
  final String content;

  const ReportTutorEvent(this.tutorId, this.content);
}
