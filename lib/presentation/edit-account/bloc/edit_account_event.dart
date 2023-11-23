part of 'edit_account_bloc.dart';

sealed class EditAccountEvent extends Equatable {
  const EditAccountEvent();

  @override
  List<Object> get props => [];
}

final class GetAccount extends EditAccountEvent {
  final String accessToken;
  const GetAccount({required this.accessToken});
}

final class SelectSubjects extends EditAccountEvent {
  final List<MapEntry<String, String>> subjects;
  const SelectSubjects({required this.subjects});
}

final class UpdateAccount extends EditAccountEvent {
  final BuildContext context;
  final String accessToken;
  final UserInfoBody userInfoBody;
  const UpdateAccount({
    required this.accessToken,
    required this.userInfoBody,
    required this.context,
  });
}

final class UploadAvatar extends EditAccountEvent {
  final BuildContext context;
  final String accessToken;
  final File image;
  const UploadAvatar({
    required this.accessToken,
    required this.image,
    required this.context,
  });
}
