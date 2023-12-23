import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/entities/user/user_entity.dart';
import 'package:let_tutor/domain/repositories/user/user_repository.dart';

class UpdateUserInfoUsecase
    implements UseCase<DataState<UserEntity>, UserInfoBody> {
  final UserRepository _userRepository;
  UpdateUserInfoUsecase(this._userRepository);

  @override
  Future<DataState<UserEntity>> call({UserInfoBody? params}) {
    return _userRepository.updateUserInfo(params!);
  }
}
