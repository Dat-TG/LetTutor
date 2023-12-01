import 'package:equatable/equatable.dart';

import 'package:let_tutor/domain/entities/user/user_entity.dart';

class AuthEntity extends Equatable {
  final UserEntity? user;
  final TokensEntity? tokens;

  const AuthEntity({this.user, this.tokens});

  AuthEntity copyWith({
    UserEntity? user,
    TokensEntity? tokens,
  }) {
    return AuthEntity(
      user: user ?? this.user,
      tokens: tokens ?? this.tokens,
    );
  }

  @override
  List<Object?> get props => [user, tokens];
}

class TokenEntity extends Equatable {
  final String? token;
  final String? expries;
  const TokenEntity({
    this.token,
    this.expries,
  });

  @override
  List<Object?> get props => [token, expries];
}

class TokensEntity extends Equatable {
  final TokenEntity? access;
  final TokenEntity? refresh;

  const TokensEntity({this.access, this.refresh});

  @override
  List<Object?> get props => [access, refresh];
}
