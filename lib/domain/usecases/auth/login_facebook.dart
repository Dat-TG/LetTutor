import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/entities/auth/auth_entity.dart';
import 'package:let_tutor/domain/repositories/auth/auth_repository.dart';

class LoginFacebookUsecase implements UseCase<DataState<AuthEntity>, String> {
  final AuthRepository _authRepository;
  LoginFacebookUsecase(this._authRepository);

  @override
  Future<DataState<AuthEntity>> call({String? params}) {
    return _authRepository.loginFacebook(accessToken: params!);
  }
}
