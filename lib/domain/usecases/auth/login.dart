import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/entities/auth/auth_entity.dart';
import 'package:let_tutor/domain/repositories/auth/auth_repository.dart';

class LoginUsecase
    implements UseCase<DataState<AuthEntity>, LoginUsecaseParams> {
  final AuthRepository _authRepository;
  LoginUsecase(this._authRepository);

  @override
  Future<DataState<AuthEntity>> call({LoginUsecaseParams? params}) {
    return _authRepository.login(
        email: params!.email, password: params.password);
  }
}

class LoginUsecaseParams {
  final String email;
  final String password;

  LoginUsecaseParams({required this.email, required this.password});
}
