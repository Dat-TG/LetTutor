import 'package:flutter/material.dart';
import 'package:let_tutor/domain/entities/auth/auth_entity.dart';

class AuthProvider extends ChangeNotifier {
  AuthEntity _authEntity = AuthEntity();
  AuthEntity get authEntity => _authEntity;
  void setAuthEntity(AuthEntity authEntity) {
    _authEntity = authEntity;
    notifyListeners();
  }
}
