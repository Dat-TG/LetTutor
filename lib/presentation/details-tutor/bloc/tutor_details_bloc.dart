// ignore_for_file: use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/utils/helpers.dart';
import 'package:let_tutor/domain/entities/tutor_details/tutor_details_entity.dart';
import 'package:let_tutor/domain/usecases/tutor/favorite_tutor.dart';
import 'package:let_tutor/domain/usecases/tutor_details/get_tutor_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/domain/usecases/tutor_details/report_tutor.dart';

part 'tutor_details_event.dart';
part 'tutor_details_state.dart';

class TutorDetailsBloc extends Bloc<TutorDetailsEvent, TutorDetailsState> {
  final GetTutorDetailsUsecase _getTutorDetailsUsecase;
  final FavoriteTutorUsecase _favoriteTutorUsecase;
  final ReportTutorUsecase _reportTutorUsecase;
  TutorDetailsBloc(this._getTutorDetailsUsecase, this._favoriteTutorUsecase,
      this._reportTutorUsecase)
      : super(const TutorDetailsLoading()) {
    on<TutorDetailsLoad>(onTutorLoad);
    on<FavoriteTutor>(onFavoriteTutor);
    on<ReportTutorEvent>(onReportTutor);
  }

  void onTutorLoad(
      TutorDetailsLoad event, Emitter<TutorDetailsState> emit) async {
    emit(const TutorDetailsLoading());
    final dataState = await _getTutorDetailsUsecase(
      params: GetTutorDetailsUsecaseParams(
        token: event.token,
        tutorId: event.tutorId,
      ),
    );
    if (dataState is DataSuccess) {
      emit(TutorDetailsDone(dataState.data!));
    } else if (dataState is DataFailed) {
      emit(TutorDetailsError(dataState.error!));
    }
  }

  void onFavoriteTutor(
      FavoriteTutor event, Emitter<TutorDetailsState> emit) async {
    final dataState = await _favoriteTutorUsecase(
      params: FavoriteTutorUsecaseParams(
          token: event.token, tutorId: event.tutorId),
    );
    if (dataState is DataSuccess) {
      if (state.tutorDetails?.isFavorite == true) {
        Helpers.showSnackBar(event.context,
            AppLocalizations.of(event.context)!.unfavoriteTutorSuccess);
      } else {
        Helpers.showSnackBar(event.context,
            AppLocalizations.of(event.context)!.favoriteTutorSuccess);
      }
      TutorDetailsEntity? tutorDetails = state.tutorDetails;
      emit(const FavoriteTutorInProcess());
      emit(TutorDetailsDone(
          tutorDetails!.changeFavorite(!(tutorDetails.isFavorite ?? false))));
    }

    if (dataState is DataFailed) {
      Helpers.showSnackBar(
          event.context, AppLocalizations.of(event.context)!.taskFailed);
    }
  }

  void onReportTutor(
      ReportTutorEvent event, Emitter<TutorDetailsState> emit) async {
    final dataState = await _reportTutorUsecase(
      params: ReportTutorUsecaseParams(
        token: event.token,
        tutorId: event.tutorId,
        content: event.content,
      ),
    );
    if (dataState is DataSuccess) {
      emit(ReportTutorDone(
          message: dataState.data ?? "Done",
          tutorDetails: state.tutorDetails!));
    } else if (dataState is DataFailed) {
      emit(ReportTutorDone(
          message: dataState.error!.message!,
          tutorDetails: state.tutorDetails!));
    }
    emit(TutorDetailsDone(state.tutorDetails!));
  }
}
