import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/repositories/auth/auth_repository.dart';

class ChangePasswordUsecase
    implements UseCase<DataState<String>, ChangePassowrdUsecaseParams> {
  final AuthRepository _authRepository;
  ChangePasswordUsecase(this._authRepository);

  @override
  Future<DataState<String>> call({ChangePassowrdUsecaseParams? params}) {
    return _authRepository.changePassword(
        token: params!.token,
        password: params.password,
        newPassword: params.newPassword);
  }
}

class ChangePassowrdUsecaseParams {
  final String token;
  final String password;
  final String newPassword;

  ChangePassowrdUsecaseParams(
      {required this.token, required this.newPassword, required this.password});
}
