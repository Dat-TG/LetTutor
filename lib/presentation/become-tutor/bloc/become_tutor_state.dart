part of 'become_tutor_bloc.dart';

final class BecomeTutorState extends Equatable {
  final TextEditingController birthDateController,
      scheduleController,
      educationController,
      professionController,
      experienceController,
      languageController,
      introductionController;
  final String country;
  final String level;
  final List<MapEntry<String, String>> selectedSpecialties;
  final String? specialitiesErrorText;
  final File? uploadImage;
  final File? uploadVideo;
  const BecomeTutorState({
    required this.birthDateController,
    required this.scheduleController,
    required this.educationController,
    required this.professionController,
    required this.experienceController,
    required this.languageController,
    required this.introductionController,
    required this.specialitiesErrorText,
    required this.level,
    required this.country,
    required this.selectedSpecialties,
    required this.uploadImage,
    required this.uploadVideo,
  });

  BecomeTutorState copyWith({
    String? specialitiesErrorText,
    String? level,
    String? country,
    List<MapEntry<String, String>>? selectedSpecialties,
    File? uploadImage,
    File? uploadVideo,
  }) {
    return BecomeTutorState(
      birthDateController: birthDateController,
      scheduleController: scheduleController,
      educationController: educationController,
      professionController: professionController,
      experienceController: experienceController,
      languageController: languageController,
      introductionController: introductionController,
      specialitiesErrorText: specialitiesErrorText,
      level: level ?? this.level,
      country: country ?? this.country,
      selectedSpecialties: selectedSpecialties ?? this.selectedSpecialties,
      uploadImage: uploadImage,
      uploadVideo: uploadVideo,
    );
  }

  @override
  List<Object?> get props => [
        birthDateController,
        scheduleController,
        educationController,
        professionController,
        experienceController,
        languageController,
        introductionController,
        specialitiesErrorText,
        level,
        country,
        selectedSpecialties,
        uploadImage,
        uploadVideo,
      ];
}
