import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'become_tutor_event.dart';
part 'become_tutor_state.dart';

class BecomeTutorBloc extends Bloc<BecomeTutorEvent, BecomeTutorState> {
  BecomeTutorBloc()
      : super(BecomeTutorState(
          birthDateController: TextEditingController(),
          scheduleController: TextEditingController(),
          educationController: TextEditingController(),
          professionController: TextEditingController(),
          experienceController: TextEditingController(),
          languageController: TextEditingController(),
          introductionController: TextEditingController(),
          specialitiesErrorText: null,
          level: 'Beginner',
          country: '🇻🇳 Vietnam',
          selectedSpecialties: const [],
          uploadImage: null,
          uploadVideo: null,
        )) {
    on<UpdateState>(onUpdateState);
  }

  void onUpdateState(UpdateState event, Emitter<BecomeTutorState> emit) {
    emit(state.copyWith(
      specialitiesErrorText: event.specialitiesErrorText,
      level: event.level,
      country: event.country,
      selectedSpecialties: event.selectedSpecialties,
      uploadImage: event.uploadImage,
      uploadVideo: event.uploadVideo,
    ));
  }
}
