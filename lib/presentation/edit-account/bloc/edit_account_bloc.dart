// ignore_for_file: use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:let_tutor/core/providers/auth_provider.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/utils/helpers.dart';
import 'package:let_tutor/domain/entities/user/user_entity.dart';
import 'package:let_tutor/domain/repositories/user/user_repository.dart';
import 'package:let_tutor/domain/usecases/user/get_user.dart';
import 'package:let_tutor/domain/usecases/user/update_user_info.dart';
import 'package:let_tutor/injection_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'edit_account_event.dart';
part 'edit_account_state.dart';

class EditAccountBloc extends Bloc<EditAccountEvent, EditAccountState> {
  final GetUserUsecase _getUserUsecase;
  final UpdateUserInfoUsecase _updateUserInfoUsecase;
  EditAccountBloc(this._getUserUsecase, this._updateUserInfoUsecase)
      : super(const AccountLoading(user: UserEntity(), selectSubjects: [])) {
    on<GetAccount>(onGetAccount);
    on<SelectSubjects>(onSelectSubjects);
    on<UpdateAccount>(onUpdateUserInfo);
  }
  void onGetAccount(GetAccount event, Emitter<EditAccountState> emit) async {
    emit(AccountLoading(
      user: state.user,
      selectSubjects: state.selectSubjects,
    ));
    final dataState = await _getUserUsecase(params: event.accessToken);
    if (dataState is DataSuccess && dataState.data != null) {
      sl<AuthProvider>().setUser(dataState.data!);
      emit(AccountLoaded(
        user: dataState.data!,
        selectSubjects: state.selectSubjects,
      ));
    }

    if (dataState is DataFailed) {
      emit(AccountError(
        user: state.user,
        error: dataState.error!,
        selectSubjects: state.selectSubjects,
      ));
    }
  }

  void onSelectSubjects(SelectSubjects event, Emitter<EditAccountState> emit) {
    emit(SelectSubjectsUpdate(
      user: state.user,
      selectSubjects: event.subjects,
      error: state.error,
    ));
    emit(SelectSubjectsUpdateSuccessful(
      user: state.user,
      selectSubjects: event.subjects,
      error: state.error,
    ));
  }

  void onUpdateUserInfo(
      UpdateAccount event, Emitter<EditAccountState> emit) async {
    emit(InfoUpdating(
      user: state.user,
      selectSubjects: state.selectSubjects,
    ));
    print('level: ${event.userInfoBody.level}');
    final dataState = await _updateUserInfoUsecase(
        params: UpdateUserInfoUsecaseParams(
      token: event.accessToken,
      userInfoBody: event.userInfoBody,
    ));
    if (dataState is DataSuccess && dataState.data != null) {
      sl<AuthProvider>().setUser(dataState.data!);
      emit(AccountLoaded(
        user: dataState.data!,
        selectSubjects: state.selectSubjects,
      ));
      Helpers.showSnackBar(event.context,
          AppLocalizations.of(event.context)!.updateInformationSuccessful);
    }

    if (dataState is DataFailed) {
      emit(AccountError(
        user: state.user,
        error: dataState.error!,
        selectSubjects: state.selectSubjects,
      ));
      Helpers.showSnackBar(
          event.context, AppLocalizations.of(event.context)!.taskFailed);
    }
  }
}
