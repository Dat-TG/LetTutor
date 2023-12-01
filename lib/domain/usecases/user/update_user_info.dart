import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/entities/user/user_entity.dart';
import 'package:let_tutor/domain/repositories/user/user_repository.dart';

class UpdateUserInfoUsecase
    implements UseCase<DataState<UserEntity>, UpdateUserInfoUsecaseParams> {
  final UserRepository _userRepository;
  UpdateUserInfoUsecase(this._userRepository);

  @override
  Future<DataState<UserEntity>> call({UpdateUserInfoUsecaseParams? params}) {
    return _userRepository.updateUserInfo(params!.token, params.userInfoBody);
  }
}

class UpdateUserInfoUsecaseParams {
  final String token;
  final UserInfoBody userInfoBody;

  UpdateUserInfoUsecaseParams({
    required this.token,
    required this.userInfoBody,
  });

  UpdateUserInfoUsecaseParams copyWith({
    String? token,
    UserInfoBody? userInfoBody,
  }) {
    return UpdateUserInfoUsecaseParams(
      token: token ?? this.token,
      userInfoBody: userInfoBody ?? this.userInfoBody,
    );
  }
}
