part of 'home_tutor_bloc.dart';

sealed class HomeTutorEvent extends Equatable {
  const HomeTutorEvent();

  @override
  List<Object> get props => [];
}

final class FetchTutor extends HomeTutorEvent {
  const FetchTutor();
}
