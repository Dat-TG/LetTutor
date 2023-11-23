import 'dart:io';

import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/core/usecase/usecase.dart';
import 'package:let_tutor/domain/entities/user/user_entity.dart';
import 'package:let_tutor/domain/repositories/user/user_repository.dart';

class UploadAvatarUsecase
    implements UseCase<DataState<UserEntity>, UploadAvatarUsecaseParams> {
  final UserRepository _userRepository;
  UploadAvatarUsecase(this._userRepository);

  @override
  Future<DataState<UserEntity>> call({UploadAvatarUsecaseParams? params}) {
    return _userRepository.uploadAvatar(params!.token, params.image);
  }
}

class UploadAvatarUsecaseParams {
  final String token;
  final File image;

  UploadAvatarUsecaseParams({
    required this.token,
    required this.image,
  });

  UploadAvatarUsecaseParams copyWith({
    String? token,
    File? image,
  }) {
    return UploadAvatarUsecaseParams(
      token: token ?? this.token,
      image: image ?? this.image,
    );
  }
}
