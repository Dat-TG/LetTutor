part of 'tutor_bloc.dart';

abstract class TutorState extends Equatable {
  final List<TutorEntity>? tutors;
  final DioException? error;
  final SearchTutorsUsecaseParams? params;
  final bool isVN;
  final bool isEN;
  final bool isForeign;
  final TextEditingController dateController;
  final TextEditingController startTimeController;
  final TextEditingController endTimeController;
  final TextEditingController nameController;
  final List<MapEntry<String, String>> selectedSpecialties;

  const TutorState({
    this.tutors,
    this.error,
    this.params,
    required this.isVN,
    required this.isEN,
    required this.isForeign,
    required this.dateController,
    required this.startTimeController,
    required this.endTimeController,
    required this.nameController,
    required this.selectedSpecialties,
  });

  @override
  List<Object?> get props => [
        tutors,
        error,
        params,
        isVN,
        isEN,
        isForeign,
        selectedSpecialties,
      ];
}

final class TutorSearchInProgress extends TutorState {
  const TutorSearchInProgress(
    List<TutorEntity> tutors,
    SearchTutorsUsecaseParams params,
    bool isVN,
    bool isEN,
    bool isForeign,
    TextEditingController dateController,
    TextEditingController startTimeController,
    TextEditingController endTimeController,
    TextEditingController nameController,
    List<MapEntry<String, String>> selectedSpecialties,
  ) : super(
          tutors: tutors,
          params: params,
          dateController: dateController,
          startTimeController: startTimeController,
          endTimeController: endTimeController,
          nameController: nameController,
          selectedSpecialties: selectedSpecialties,
          isEN: isEN,
          isVN: isVN,
          isForeign: isForeign,
        );
}

final class TutorSearchSuccess extends TutorState {
  const TutorSearchSuccess(
    List<TutorEntity> tutors,
    SearchTutorsUsecaseParams params,
    bool isVN,
    bool isEN,
    bool isForeign,
    TextEditingController dateController,
    TextEditingController startTimeController,
    TextEditingController endTimeController,
    TextEditingController nameController,
    List<MapEntry<String, String>> selectedSpecialties,
  ) : super(
          tutors: tutors,
          params: params,
          dateController: dateController,
          startTimeController: startTimeController,
          endTimeController: endTimeController,
          nameController: nameController,
          selectedSpecialties: selectedSpecialties,
          isEN: isEN,
          isVN: isVN,
          isForeign: isForeign,
        );
}

final class TutorSearchFailure extends TutorState {
  const TutorSearchFailure(
    DioException error,
    List<TutorEntity>? tutors,
    SearchTutorsUsecaseParams? params,
    bool isVN,
    bool isEN,
    bool isForeign,
    TextEditingController dateController,
    TextEditingController startTimeController,
    TextEditingController endTimeController,
    TextEditingController nameController,
    List<MapEntry<String, String>> selectedSpecialties,
  ) : super(
          error: error,
          dateController: dateController,
          startTimeController: startTimeController,
          endTimeController: endTimeController,
          nameController: nameController,
          selectedSpecialties: selectedSpecialties,
          isEN: isEN,
          isVN: isVN,
          isForeign: isForeign,
          params: params,
          tutors: tutors,
        );
}

final class TutorNotFound extends TutorState {
  const TutorNotFound(
    List<TutorEntity> tutors,
    SearchTutorsUsecaseParams params,
    bool isVN,
    bool isEN,
    bool isForeign,
    TextEditingController dateController,
    TextEditingController startTimeController,
    TextEditingController endTimeController,
    TextEditingController nameController,
    List<MapEntry<String, String>> selectedSpecialties,
  ) : super(
          tutors: tutors,
          params: params,
          dateController: dateController,
          startTimeController: startTimeController,
          endTimeController: endTimeController,
          nameController: nameController,
          selectedSpecialties: selectedSpecialties,
          isEN: isEN,
          isVN: isVN,
          isForeign: isForeign,
        );
}

final class TutorSearchComplete extends TutorState {
  const TutorSearchComplete(
    List<TutorEntity> tutors,
    SearchTutorsUsecaseParams params,
    bool isVN,
    bool isEN,
    bool isForeign,
    TextEditingController dateController,
    TextEditingController startTimeController,
    TextEditingController endTimeController,
    TextEditingController nameController,
    List<MapEntry<String, String>> selectedSpecialties,
  ) : super(
          tutors: tutors,
          params: params,
          dateController: dateController,
          startTimeController: startTimeController,
          endTimeController: endTimeController,
          nameController: nameController,
          selectedSpecialties: selectedSpecialties,
          isEN: isEN,
          isVN: isVN,
          isForeign: isForeign,
        );
}

final class TutorUpdateFilters extends TutorState {
  const TutorUpdateFilters(
    List<TutorEntity> tutors,
    SearchTutorsUsecaseParams params,
    bool isVN,
    bool isEN,
    bool isForeign,
    TextEditingController dateController,
    TextEditingController startTimeController,
    TextEditingController endTimeController,
    TextEditingController nameController,
    List<MapEntry<String, String>> selectedSpecialties,
  ) : super(
          tutors: tutors,
          params: params,
          dateController: dateController,
          startTimeController: startTimeController,
          endTimeController: endTimeController,
          nameController: nameController,
          selectedSpecialties: selectedSpecialties,
          isEN: isEN,
          isVN: isVN,
          isForeign: isForeign,
        );
}

final class FavoriteTutorDone extends TutorState {
  const FavoriteTutorDone(
    List<TutorEntity> tutors,
    SearchTutorsUsecaseParams params,
    bool isVN,
    bool isEN,
    bool isForeign,
    TextEditingController dateController,
    TextEditingController startTimeController,
    TextEditingController endTimeController,
    TextEditingController nameController,
    List<MapEntry<String, String>> selectedSpecialties,
  ) : super(
          tutors: tutors,
          params: params,
          dateController: dateController,
          startTimeController: startTimeController,
          endTimeController: endTimeController,
          nameController: nameController,
          selectedSpecialties: selectedSpecialties,
          isEN: isEN,
          isVN: isVN,
          isForeign: isForeign,
        );
}
