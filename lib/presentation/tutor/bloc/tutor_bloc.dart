import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/tutor/tutor_entity.dart';
import 'package:let_tutor/domain/repositories/tutor/tutor_repositoy.dart';
import 'package:let_tutor/domain/usecases/tutor/search_tutors.dart';
import 'package:let_tutor/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'tutor_event.dart';
part 'tutor_state.dart';

class TutorBloc extends Bloc<TutorEvent, TutorState> {
  final SearchTutorsUsecase _searchTutorsUsecase;
  final token = sl<SharedPreferences>().getString('access-token')!;
  TutorBloc(this._searchTutorsUsecase)
      : super(
          TutorSearchInProgress(
              const [],
              SearchTutorsUsecaseParams(
                token: sl<SharedPreferences>().getString('access-token')!,
                params: TutorSearchParams(),
              ),
              true,
              true,
              TextEditingController(),
              TextEditingController(),
              TextEditingController(),
              TextEditingController(),
              const []),
        ) {
    on<TutorSearching>(onSearch);
    on<TutorUpdateIsEN>(onUpdateIsEN);
    on<TutorUpdateIsVN>(onUpdateIsVN);
    on<TutorUpdateSpecialties>(onUpdateSpecialties);
  }

  void onSearch(TutorSearching event, Emitter<TutorState> emit) async {
    emit(TutorSearchInProgress(
      state.tutors ?? [],
      state.params!,
      state.isEN,
      state.isVN,
      state.dateController,
      state.startTimeController,
      state.endTimeController,
      state.nameController,
      state.selectedSpecialties,
    ));
    final dataState = await _searchTutorsUsecase(params: event.params);
    print(
        'fetch data page ${event.params.params.page} name ${state.nameController.text} specialties ${state.selectedSpecialties} date ${state.dateController.text} startTime ${state.startTimeController.text} endTime ${state.endTimeController.text} isEN ${state.isEN} isVN ${state.isVN} ');
    if (dataState is DataSuccess) {
      if (dataState.data!.isNotEmpty) {
        if ((event.params.params.page ?? 0) >
            (state.params?.params.page ?? 0)) {
          emit(TutorSearchSuccess(
            [...(state.tutors ?? []), ...(dataState.data ?? [])],
            event.params,
            state.isEN,
            state.isVN,
            state.dateController,
            state.startTimeController,
            state.endTimeController,
            state.nameController,
            state.selectedSpecialties,
          ));
        } else {
          emit(TutorSearchSuccess(
            dataState.data ?? [],
            event.params,
            state.isEN,
            state.isVN,
            state.dateController,
            state.startTimeController,
            state.endTimeController,
            state.nameController,
            state.selectedSpecialties,
          ));
        }
      } else {
        emit(TutorNotFound(
          state.tutors ?? [],
          state.params!,
          state.isEN,
          state.isVN,
          state.dateController,
          state.startTimeController,
          state.endTimeController,
          state.nameController,
          state.selectedSpecialties,
        ));
      }
    }

    if (dataState is DataFailed) {
      emit(TutorSearchFailure(
        dataState.error!,
        state.isEN,
        state.isVN,
        state.dateController,
        state.startTimeController,
        state.endTimeController,
        state.nameController,
        state.selectedSpecialties,
      ));
    }
  }

  void onUpdateIsEN(TutorUpdateIsEN event, Emitter<TutorState> emit) {
    emit(TutorSearchInProgress(
      state.tutors ?? [],
      state.params!,
      state.isVN,
      event.isEN,
      state.dateController,
      state.startTimeController,
      state.endTimeController,
      state.nameController,
      state.selectedSpecialties,
    ));
  }

  void onUpdateIsVN(TutorUpdateIsVN event, Emitter<TutorState> emit) {
    emit(TutorSearchInProgress(
      state.tutors ?? [],
      state.params!,
      event.isVN,
      state.isEN,
      state.dateController,
      state.startTimeController,
      state.endTimeController,
      state.nameController,
      state.selectedSpecialties,
    ));
  }

  void onUpdateSpecialties(
      TutorUpdateSpecialties event, Emitter<TutorState> emit) {
    emit(TutorSearchInProgress(
      state.tutors ?? [],
      state.params!,
      state.isEN,
      state.isVN,
      state.dateController,
      state.startTimeController,
      state.endTimeController,
      state.nameController,
      event.selectedSpecialties,
    ));
  }
}
