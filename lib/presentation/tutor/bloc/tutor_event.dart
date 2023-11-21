part of 'tutor_bloc.dart';

sealed class TutorEvent extends Equatable {
  const TutorEvent();

  @override
  List<Object> get props => [];
}

final class TutorSearching extends TutorEvent {
  final SearchTutorsUsecaseParams params;
  const TutorSearching(this.params);

  @override
  List<Object> get props => [params];
}

final class TutorUpdateIsEN extends TutorEvent {
  final bool isEN;
  const TutorUpdateIsEN(this.isEN);

  @override
  List<Object> get props => [isEN];
}

final class TutorUpdateIsVN extends TutorEvent {
  final bool isVN;
  const TutorUpdateIsVN(this.isVN);

  @override
  List<Object> get props => [isVN];
}

final class TutorUpdateSpecialties extends TutorEvent {
  final List<MapEntry<String, String>> selectedSpecialties;
  const TutorUpdateSpecialties(this.selectedSpecialties);

  @override
  List<Object> get props => [selectedSpecialties];
}

final class TutorUpdateIsForeign extends TutorEvent {
  final bool isForeign;
  const TutorUpdateIsForeign(this.isForeign);

  @override
  List<Object> get props => [isForeign];
}

final class FavoriteTutor extends TutorEvent {
  final String tutorId;
  final int index;
  final BuildContext context;
  const FavoriteTutor(this.tutorId, this.index, this.context);

  @override
  List<Object> get props => [tutorId, index, context];
}
