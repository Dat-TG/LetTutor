import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/repositories/auth/auth_repository.dart';

class ForgotPasswordUsecase implements UseCase<DataState<String>, String> {
  final AuthRepository _authRepository;
  ForgotPasswordUsecase(this._authRepository);

  @override
  Future<DataState<String>> call({String? params}) {
    return _authRepository.forgotPassword(email: params!);
  }
}
