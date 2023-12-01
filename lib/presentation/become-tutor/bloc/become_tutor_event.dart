part of 'become_tutor_bloc.dart';

sealed class BecomeTutorEvent extends Equatable {
  const BecomeTutorEvent();

  @override
  List<Object> get props => [];
}

final class UpdateState extends BecomeTutorEvent {
  final String? country;
  final String? level;
  final List<MapEntry<String, String>>? selectedSpecialties;
  final String? specialitiesErrorText;
  final File? uploadImage;
  final File? uploadVideo;
  const UpdateState({
    this.country,
    this.level,
    this.selectedSpecialties,
    required this.specialitiesErrorText,
    required this.uploadImage,
    required this.uploadVideo,
  });
}
