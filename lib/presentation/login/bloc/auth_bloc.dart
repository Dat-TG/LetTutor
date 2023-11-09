// ignore_for_file: use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/auth/auth_entity.dart';
import 'package:let_tutor/domain/usecases/auth/login.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUsecase;
  AuthBloc(this.loginUsecase) : super(const AuthInitial()) {
    on<LoginEvent>(onLogin);
    on<InitialEvent>(onInitial);
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

  void onInitial(InitialEvent event, Emitter<AuthState> emit) {
    emit(const AuthInitial());
  }
}
