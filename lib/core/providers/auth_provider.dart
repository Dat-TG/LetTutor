import 'package:flutter/material.dart';
import 'package:let_tutor/domain/entities/auth/auth_entity.dart';
import 'package:let_tutor/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  AuthEntity _authEntity = const AuthEntity();
  AuthEntity get authEntity => _authEntity;
  void setAuthEntity(AuthEntity authEntity) {
    _authEntity = authEntity;
    notifyListeners();
  }

  void logOut() {
    sl<SharedPreferences>().remove('access-token');
    sl<SharedPreferences>().remove('refresh-token');
    notifyListeners();
  }
}
