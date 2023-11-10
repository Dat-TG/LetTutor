part of 'tutor_bloc.dart';

sealed class TutorEvent extends Equatable {
  const TutorEvent();

  @override
  List<Object> get props => [];
}

final class TutorSearching extends TutorEvent {
  final SearchTutorsUsecaseParams params;
  const TutorSearching(this.params);
}
