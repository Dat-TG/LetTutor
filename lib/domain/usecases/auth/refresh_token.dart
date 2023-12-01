import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/entities/auth/auth_entity.dart';
import 'package:let_tutor/domain/repositories/auth/auth_repository.dart';

class RefreshTokenUsecase
    implements UseCase<DataState<AuthEntity>, RefreshTokenUsecaseParams> {
  final AuthRepository _authRepository;
  RefreshTokenUsecase(this._authRepository);

  @override
  Future<DataState<AuthEntity>> call({RefreshTokenUsecaseParams? params}) {
    return _authRepository.refreshToken(
        refreshToken: params!.refreshToken, timezone: params.timezone);
  }
}

class RefreshTokenUsecaseParams {
  final String refreshToken;
  final int timezone;

  RefreshTokenUsecaseParams(
      {required this.refreshToken, required this.timezone});
}
