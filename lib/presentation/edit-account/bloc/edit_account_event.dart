part of 'edit_account_bloc.dart';

sealed class EditAccountEvent extends Equatable {
  const EditAccountEvent();

  @override
  List<Object> get props => [];
}

final class GetAccount extends EditAccountEvent {
  const GetAccount();
}

final class SelectSubjects extends EditAccountEvent {
  final List<MapEntry<String, String>> subjects;
  const SelectSubjects({required this.subjects});
}

final class UpdateAccount extends EditAccountEvent {
  final BuildContext context;
  final UserInfoBody userInfoBody;
  const UpdateAccount({
    required this.userInfoBody,
    required this.context,
  });
}

final class UploadAvatar extends EditAccountEvent {
  final BuildContext context;
  final File image;
  const UploadAvatar({
    required this.image,
    required this.context,
  });
}
