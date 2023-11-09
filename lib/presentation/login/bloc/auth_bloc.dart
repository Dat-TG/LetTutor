// ignore_for_file: use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/auth/auth_entity.dart';
import 'package:let_tutor/domain/usecases/auth/login.dart';
import 'package:let_tutor/domain/usecases/user/get_user.dart';
import 'package:let_tutor/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUsecase;
  final GetUserUsecase getUserUsecase;
  AuthBloc(this.loginUsecase, this.getUserUsecase)
      : super(const AuthInitial()) {
    on<LoginEvent>(onLogin);
    on<InitialEvent>(onInitial);
    on<ResetStateEvent>(onResetState);
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

  void onInitial(InitialEvent event, Emitter<AuthState> emit) async {
    print("onInitial");
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
        emit(const AuthInitial());
        // TODO: refresh token
      }
    }
  }

  void onResetState(ResetStateEvent event, Emitter<AuthState> emit) async {
    emit(const AuthInitial());
  }
}