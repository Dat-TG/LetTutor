part of 'tutor_bloc.dart';

sealed class TutorEvent extends Equatable {
  const TutorEvent();

  @override
  List<Object> get props => [];
}

final class TutorSearch extends TutorEvent {
  final SearchTutorsUsecaseParams params;
  const TutorSearch(this.params);
}
