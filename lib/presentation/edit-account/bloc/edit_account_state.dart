part of 'edit_account_bloc.dart';

sealed class EditAccountState extends Equatable {
  final UserEntity user;
  final DioException? error;
  final List<MapEntry<String, String>> selectSubjects;
  const EditAccountState({
    required this.user,
    this.error,
    required this.selectSubjects,
  });

  @override
  List<Object> get props => [];
}

final class AccountLoading extends EditAccountState {
  const AccountLoading({
    required UserEntity user,
    required List<MapEntry<String, String>> selectSubjects,
  }) : super(
          user: user,
          selectSubjects: selectSubjects,
        );
}

final class AccountLoaded extends EditAccountState {
  const AccountLoaded({
    required UserEntity user,
    required List<MapEntry<String, String>> selectSubjects,
  }) : super(
          user: user,
          selectSubjects: selectSubjects,
        );
}

final class AccountError extends EditAccountState {
  const AccountError({
    required UserEntity user,
    required DioException error,
    required List<MapEntry<String, String>> selectSubjects,
  }) : super(
          user: user,
          error: error,
          selectSubjects: selectSubjects,
        );
}

final class SelectSubjectsUpdate extends EditAccountState {
  const SelectSubjectsUpdate({
    required UserEntity user,
    required DioException? error,
    required List<MapEntry<String, String>> selectSubjects,
  }) : super(
          user: user,
          error: error,
          selectSubjects: selectSubjects,
        );
}

final class SelectSubjectsUpdateSuccessful extends EditAccountState {
  const SelectSubjectsUpdateSuccessful({
    required UserEntity user,
    required DioException? error,
    required List<MapEntry<String, String>> selectSubjects,
  }) : super(
          user: user,
          error: error,
          selectSubjects: selectSubjects,
        );
}

final class InfoUpdating extends EditAccountState {
  const InfoUpdating({
    required UserEntity user,
    required List<MapEntry<String, String>> selectSubjects,
  }) : super(
          user: user,
          selectSubjects: selectSubjects,
        );
}

final class AvatarUploading extends EditAccountState {
  const AvatarUploading({
    required UserEntity user,
    required List<MapEntry<String, String>> selectSubjects,
  }) : super(
          user: user,
          selectSubjects: selectSubjects,
        );
}
