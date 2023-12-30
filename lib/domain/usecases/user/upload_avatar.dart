import 'dart:io';

import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/entities/user/user_entity.dart';
import 'package:let_tutor/domain/repositories/user/user_repository.dart';

class UploadAvatarUsecase implements UseCase<DataState<UserEntity>, File> {
  final UserRepository _userRepository;
  UploadAvatarUsecase(this._userRepository);

  @override
  Future<DataState<UserEntity>> call({File? params}) {
    return _userRepository.uploadAvatar(params!);
  }
}
