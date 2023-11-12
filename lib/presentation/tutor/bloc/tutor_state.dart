part of 'tutor_bloc.dart';

abstract class TutorState extends Equatable {
  final List<TutorEntity>? tutors;
  final DioException? error;
  final SearchTutorsUsecaseParams? params;
  final bool isVN;
  final bool isEN;
  final TextEditingController dateController;
  final TextEditingController startTimeController;
  final TextEditingController endTimeController;
  final TextEditingController nameController;
  final List<String> selectedSpecialties;
  const TutorState({
    this.tutors,
    this.error,
    this.params,
    required this.isVN,
    required this.isEN,
    required this.dateController,
    required this.startTimeController,
    required this.endTimeController,
    required this.nameController,
    required this.selectedSpecialties,
  });

  @override
  List<Object?> get props => [tutors, error, params];
}

final class TutorSearchInProgress extends TutorState {
  const TutorSearchInProgress(
    List<TutorEntity> tutors,
    SearchTutorsUsecaseParams params,
    bool isVN,
    bool isEN,
    TextEditingController dateController,
    TextEditingController startTimeController,
    TextEditingController endTimeController,
    TextEditingController nameController,
    List<String> selectedSpecialties,
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
        );
}

final class TutorSearchSuccess extends TutorState {
  const TutorSearchSuccess(
    List<TutorEntity> tutors,
    SearchTutorsUsecaseParams params,
    bool isVN,
    bool isEN,
    TextEditingController dateController,
    TextEditingController startTimeController,
    TextEditingController endTimeController,
    TextEditingController nameController,
    List<String> selectedSpecialties,
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
        );
}

final class TutorSearchFailure extends TutorState {
  const TutorSearchFailure(
    DioException error,
    bool isVN,
    bool isEN,
    TextEditingController dateController,
    TextEditingController startTimeController,
    TextEditingController endTimeController,
    TextEditingController nameController,
    List<String> selectedSpecialties,
  ) : super(
          error: error,
          dateController: dateController,
          startTimeController: startTimeController,
          endTimeController: endTimeController,
          nameController: nameController,
          selectedSpecialties: selectedSpecialties,
          isEN: isEN,
          isVN: isVN,
        );
}

final class TutorNotFound extends TutorState {
  const TutorNotFound(
    List<TutorEntity> tutors,
    SearchTutorsUsecaseParams params,
    bool isVN,
    bool isEN,
    TextEditingController dateController,
    TextEditingController startTimeController,
    TextEditingController endTimeController,
    TextEditingController nameController,
    List<String> selectedSpecialties,
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
        );
}
