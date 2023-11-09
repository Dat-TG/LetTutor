import 'package:let_tutor/data/models/user/user_model.dart';
import 'package:let_tutor/domain/entities/auth/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({UserModel? user, TokensModel? tokens})
      : super(
          user: user,
          tokens: tokens,
        );
  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      user: UserModel.fromJson(json['user'] ?? {}),
      tokens: TokensModel.fromJson(json['tokens'] ?? {}),
    );
  }
}

class TokenModel extends TokenEntity {
  const TokenModel({
    String? token,
    String? expries,
  }) : super(
          expries: expries,
          token: token,
        );

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      token: json['token'] ?? "",
      expries: json['expries'] ?? "",
    );
  }
}

class TokensModel extends TokensEntity {
  const TokensModel({TokenModel? access, TokenModel? refresh})
      : super(
          access: access,
          refresh: refresh,
        );

  factory TokensModel.fromJson(Map<String, dynamic> json) {
    return TokensModel(
      access: TokenModel.fromJson(json['access']),
      refresh: TokenModel.fromJson(json['refresh']),
    );
  }
}
