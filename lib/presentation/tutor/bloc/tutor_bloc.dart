// ignore_for_file: use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/utils/helpers.dart';
import 'package:let_tutor/data/models/tutor/tutor_model.dart';
import 'package:let_tutor/domain/entities/tutor/tutor_entity.dart';
import 'package:let_tutor/domain/repositories/tutor/tutor_repositoy.dart';
import 'package:let_tutor/domain/usecases/tutor/favorite_tutor.dart';
import 'package:let_tutor/domain/usecases/tutor/search_tutors.dart';
import 'package:let_tutor/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'tutor_event.dart';
part 'tutor_state.dart';

class TutorBloc extends Bloc<TutorEvent, TutorState> {
  final SearchTutorsUsecase _searchTutorsUsecase;
  final FavoriteTutorUsecase _favoriteTutorUsecase;
  final token = sl<SharedPreferences>().getString('access-token')!;
  TutorBloc(this._searchTutorsUsecase, this._favoriteTutorUsecase)
      : super(
          TutorSearchInProgress(
              const [],
              SearchTutorsUsecaseParams(
                token: sl<SharedPreferences>().getString('access-token')!,
                params: TutorSearchParams(),
              ),
              true,
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
    on<TutorUpdateIsForeign>(onUpdateIsForeign);
    on<FavoriteTutor>(onFavoriteTutor);
  }

  void onSearch(TutorSearching event, Emitter<TutorState> emit) async {
    emit(TutorSearchInProgress(
      state.tutors ?? [],
      event.params.copyWith(
          params: event.params.params.copyWith(
        page: state.params?.params.page ?? 0,
        isNative: state.isEN,
        isVietnamese: state.isVN,
      )),
      state.isVN,
      state.isEN,
      state.isForeign,
      state.dateController,
      state.startTimeController,
      state.endTimeController,
      state.nameController,
      state.selectedSpecialties,
    ));

    final dataState = await _searchTutorsUsecase(params: event.params);
    print(
        'page ${event.params.params.page} ${state.params?.params.page} ${state.params?.params.specialties} ${dataState.data?.length}');
    if (dataState is DataSuccess) {
      if (dataState.data!.isNotEmpty) {
        if ((event.params.params.page ?? 0) >
            (state.params?.params.page ?? 0)) {
          emit(TutorSearchSuccess(
            [...(state.tutors ?? []), ...(dataState.data ?? [])],
            event.params,
            state.isVN,
            state.isEN,
            state.isForeign,
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
            state.isVN,
            state.isEN,
            state.isForeign,
            state.dateController,
            state.startTimeController,
            state.endTimeController,
            state.nameController,
            state.selectedSpecialties,
          ));
        }
      } else {
        if (event.params.params.page! == 1 || state.tutors!.isEmpty) {
          emit(TutorNotFound(
            const [],
            state.params!.copyWith(
                params: state.params!.params.copyWith(
                    page: 1, isNative: state.isEN, isVietnamese: state.isVN)),
            state.isVN,
            state.isEN,
            state.isForeign,
            state.dateController,
            state.startTimeController,
            state.endTimeController,
            state.nameController,
            state.selectedSpecialties,
          ));
        } else {
          emit(TutorSearchComplete(
            state.tutors ?? [],
            event.params,
            state.isVN,
            state.isEN,
            state.isForeign,
            state.dateController,
            state.startTimeController,
            state.endTimeController,
            state.nameController,
            state.selectedSpecialties,
          ));
        }
      }
    }

    if (dataState is DataFailed) {
      emit(TutorSearchFailure(
        dataState.error!,
        state.tutors ?? [],
        state.params,
        state.isVN,
        state.isEN,
        state.isForeign,
        state.dateController,
        state.startTimeController,
        state.endTimeController,
        state.nameController,
        state.selectedSpecialties,
      ));
    }
  }

  void onUpdateIsEN(TutorUpdateIsEN event, Emitter<TutorState> emit) {
    emit(TutorUpdateFilters(
      state.tutors ?? [],
      (state.isVN == event.isEN && event.isEN == state.isForeign)
          ? state.params!.copyWith(
              params: state.params!.params
                  .copyWith(isVietnamese: null, isNative: null, page: 1))
          : state.params!.copyWith(
              params: state.params!.params.copyWith(
                  isNative: event.isEN, isVietnamese: state.isVN, page: 1)),
      state.isVN,
      event.isEN,
      state.isForeign,
      state.dateController,
      state.startTimeController,
      state.endTimeController,
      state.nameController,
      state.selectedSpecialties,
    ));
  }

  void onUpdateIsVN(TutorUpdateIsVN event, Emitter<TutorState> emit) {
    emit(TutorUpdateFilters(
      state.tutors ?? [],
      (event.isVN == state.isEN && state.isEN == state.isForeign)
          ? state.params!.copyWith(
              params: state.params!.params
                  .copyWith(isVietnamese: null, isNative: null, page: 1))
          : state.params!.copyWith(
              params: state.params!.params.copyWith(
                  isVietnamese: event.isVN, isNative: state.isEN, page: 1)),
      event.isVN,
      state.isEN,
      state.isForeign,
      state.dateController,
      state.startTimeController,
      state.endTimeController,
      state.nameController,
      state.selectedSpecialties,
    ));
  }

  void onUpdateSpecialties(
      TutorUpdateSpecialties event, Emitter<TutorState> emit) {
    emit(TutorUpdateFilters(
      state.tutors ?? [],
      state.params!.copyWith(
          params: state.params!.params.copyWith(
        isVietnamese: state.isVN,
        isNative: state.isEN,
        page: 1,
        specialties: event.selectedSpecialties.map((e) => e.key).toList(),
      )),
      state.isVN,
      state.isEN,
      state.isForeign,
      state.dateController,
      state.startTimeController,
      state.endTimeController,
      state.nameController,
      event.selectedSpecialties,
    ));
  }

  void onUpdateIsForeign(TutorUpdateIsForeign event, Emitter<TutorState> emit) {
    emit(TutorUpdateFilters(
      state.tutors ?? [],
      (state.isVN == state.isEN && state.isEN == event.isForeign)
          ? state.params!.copyWith(
              params: state.params!.params
                  .copyWith(isVietnamese: null, isNative: null, page: 1))
          : state.params!.copyWith(
              params: state.params!.params.copyWith(
                  page: 1, isNative: state.isEN, isVietnamese: state.isVN)),
      state.isVN,
      state.isEN,
      event.isForeign,
      state.dateController,
      state.startTimeController,
      state.endTimeController,
      state.nameController,
      state.selectedSpecialties,
    ));
  }

  void onFavoriteTutor(FavoriteTutor event, Emitter<TutorState> emit) async {
    final dataState = await _favoriteTutorUsecase(
      params: FavoriteTutorUsecaseParams(token: token, tutorId: event.tutorId),
    );
    if (dataState is DataSuccess) {
      if (state.tutors?[event.index].isFavoriteTutor == true) {
        Helpers.showSnackBar(event.context,
            AppLocalizations.of(event.context)!.unfavoriteTutorSuccess);
      } else {
        Helpers.showSnackBar(event.context,
            AppLocalizations.of(event.context)!.favoriteTutorSuccess);
      }
      state.tutors?[event.index] = state.tutors![event.index].copyWith(
          isFavoriteTutor:
              !(state.tutors![event.index].isFavoriteTutor ?? false));

      bool isComplete = (state is TutorSearchComplete);

      emit(FavoriteTutorDone(
        state.tutors ?? [],
        state.params!,
        state.isVN,
        state.isEN,
        state.isForeign,
        state.dateController,
        state.startTimeController,
        state.endTimeController,
        state.nameController,
        state.selectedSpecialties,
      ));

      if (isComplete) {
        emit(TutorSearchComplete(
          state.tutors ?? [],
          state.params!,
          state.isVN,
          state.isEN,
          state.isForeign,
          state.dateController,
          state.startTimeController,
          state.endTimeController,
          state.nameController,
          state.selectedSpecialties,
        ));
      } else {
        emit(TutorSearchSuccess(
          state.tutors ?? [],
          state.params!,
          state.isVN,
          state.isEN,
          state.isForeign,
          state.dateController,
          state.startTimeController,
          state.endTimeController,
          state.nameController,
          state.selectedSpecialties,
        ));
      }
    }

    if (dataState is DataFailed) {
      Helpers.showSnackBar(
          event.context, AppLocalizations.of(event.context)!.taskFailed);
    }
  }
}
