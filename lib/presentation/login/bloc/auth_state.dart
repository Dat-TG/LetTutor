part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  final AuthEntity? authEntity;
  final DioException? dioException;

  const AuthState({this.authEntity, this.dioException});

  @override
  List<Object?> get props => [authEntity, dioException];
}

final class AuthInitial extends AuthState {
  const AuthInitial();
}

final class AuthLoadToken extends AuthState {
  const AuthLoadToken();
}

final class AuthInProress extends AuthState {
  const AuthInProress();
}

final class AuthForgotPassword extends AuthState {
  const AuthForgotPassword();
}

final class AuthSuccessful extends AuthState {
  const AuthSuccessful(AuthEntity authEntity) : super(authEntity: authEntity);
}

final class AuthFail extends AuthState {
  const AuthFail(DioException dioException) : super(dioException: dioException);
}
