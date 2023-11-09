import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/entities/user/user_entity.dart';
import 'package:let_tutor/domain/repositories/user/user_repository.dart';

class GetUserUsecase implements UseCase<DataState<UserEntity>, void> {
  final UserRepository _userRepository;
  GetUserUsecase(this._userRepository);

  @override
  Future<DataState<UserEntity>> call({void params}) {
    return _userRepository.getUser();
  }
}
