import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/entities/auth/auth_entity.dart';
import 'package:let_tutor/domain/repositories/auth/auth_repository.dart';
import 'package:let_tutor/domain/usecases/auth/login.dart';

class RegisterUsecase
    implements UseCase<DataState<AuthEntity>, LoginUsecaseParams> {
  final AuthRepository _authRepository;
  RegisterUsecase(this._authRepository);

  @override
  Future<DataState<AuthEntity>> call({LoginUsecaseParams? params}) {
    return _authRepository.register(
        email: params!.email, password: params.password);
  }
}
