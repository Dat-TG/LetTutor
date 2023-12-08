// ignore_for_file: use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/utils/helpers.dart';
import 'package:let_tutor/domain/entities/auth/auth_entity.dart';
import 'package:let_tutor/domain/usecases/auth/forgot_password.dart';
import 'package:let_tutor/domain/usecases/auth/login.dart';
import 'package:let_tutor/domain/usecases/auth/login_google.dart';
import 'package:let_tutor/domain/usecases/auth/refresh_token.dart';
import 'package:let_tutor/domain/usecases/auth/register.dart';
import 'package:let_tutor/domain/usecases/user/get_user.dart';
import 'package:let_tutor/injection_container.dart';
import 'package:let_tutor/presentation/login/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUsecase;
  final GetUserUsecase getUserUsecase;
  final RefreshTokenUsecase refreshTokenUsecase;
  final RegisterUsecase registerUsecase;
  final ForgotPasswordUsecase forgotPasswordUsecase;
  final LoginGoogleUsecase loginGoogleUsecase;
  AuthBloc(
    this.loginUsecase,
    this.getUserUsecase,
    this.refreshTokenUsecase,
    this.registerUsecase,
    this.forgotPasswordUsecase,
    this.loginGoogleUsecase,
  ) : super(const AuthInitial()) {
    on<LoginEvent>(onLogin);
    on<InitialEvent>(onInitial);
    on<ResetStateEvent>(onResetState);
    on<RegisterEvent>(onRegister);
    on<ForgotPasswordEvent>(onForgotPassoword);
    on<LoginGoogleEvent>(onLoginGoogle);
  }

  void onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(const AuthInProress());
    final dataState = await loginUsecase(
      params: LoginUsecaseParams(
        email: event.email,
        password: event.password,
      ),
    );
    if (dataState is DataSuccess &&
        dataState.data!.tokens!.access!.token!.isNotEmpty) {
      emit(AuthSuccessful(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(AuthFail(dataState.error!));
    }
  }

  void onLoginGoogle(LoginGoogleEvent event, Emitter<AuthState> emit) async {
    emit(const AuthInProress());
    final dataState = await loginGoogleUsecase(
      params: event.accessToken,
    );
    if (dataState is DataSuccess &&
        dataState.data!.tokens!.access!.token!.isNotEmpty) {
      emit(AuthSuccessful(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(AuthFail(dataState.error!));
    }
  }

  void onInitial(InitialEvent event, Emitter<AuthState> emit) async {
    emit(const AuthInitial());
    final String? accessToken =
        sl<SharedPreferences>().getString('access-token');
    final String? refreshToken =
        sl<SharedPreferences>().getString('refresh-token');

    if (accessToken != null && accessToken.isNotEmpty) {
      emit(const AuthLoadToken());
      final dataState = await getUserUsecase(params: accessToken);

      if (dataState is DataSuccess && dataState.data != null) {
        emit(
          AuthSuccessful(
            AuthEntity(
                user: dataState.data!,
                tokens: TokensEntity(
                  access: TokenEntity(token: accessToken),
                  refresh: TokenEntity(token: refreshToken!),
                )),
          ),
        );
      } else if (dataState is DataFailed) {
        final dataStateRefresh = await refreshTokenUsecase(
          params: RefreshTokenUsecaseParams(
            refreshToken: refreshToken ?? '',
            timezone: 7,
          ),
        );
        if (dataStateRefresh is DataSuccess && dataStateRefresh.data != null) {
          emit(
            AuthSuccessful(dataStateRefresh.data!),
          );
        } else if (dataState is DataFailed) {
          sl<SharedPreferences>().remove('access-token');
          sl<SharedPreferences>().remove('refresh-token');
          emit(AuthFail(dataState.error!));
        }
      }
    }
  }

  void onResetState(ResetStateEvent event, Emitter<AuthState> emit) async {
    emit(const AuthInitial());
  }

  void onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(const AuthInProress());
    final dataState = await registerUsecase(
      params: LoginUsecaseParams(
        email: event.email,
        password: event.password,
      ),
    );
    if (dataState is DataSuccess &&
        dataState.data!.tokens!.access!.token!.isNotEmpty) {
      emit(AuthSuccessful(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(AuthFail(dataState.error!));
    }
  }

  void onForgotPassoword(
      ForgotPasswordEvent event, Emitter<AuthState> emit) async {
    emit(const AuthInProress());
    final dataState = await forgotPasswordUsecase(
      params: event.email,
    );
    if (dataState is DataSuccess) {
      emit(const AuthForgotPassword());
      Helpers.showSnackBar(event.context, dataState.data!);
      GoRouter.of(event.context).goNamed(LoginScreen.routeName);
    }

    if (dataState is DataFailed) {
      emit(const AuthForgotPassword());
      Helpers.showSnackBar(
          event.context, dataState.error?.response?.data['message'] ?? "Error");
    }
  }
}
