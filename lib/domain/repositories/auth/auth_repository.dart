import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/auth/auth_entity.dart';

abstract class AuthRepository {
  Future<DataState<AuthEntity>> login(
      {required String email, required String password});
  Future<DataState<AuthEntity>> loginGoogle({required String accessToken});
  Future<DataState<AuthEntity>> refreshToken(
      {required String refreshToken, required int timezone});
  Future<DataState<AuthEntity>> register(
      {required String email, required String password});
  Future<DataState<String>> forgotPassword({required String email});
  Future<DataState<String>> changePassword(
      {required String token,
      required String password,
      required String newPassword});
}
