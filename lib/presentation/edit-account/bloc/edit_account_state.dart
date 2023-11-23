part of 'edit_account_bloc.dart';

sealed class EditAccountState extends Equatable {
  final UserEntity user;
  final DioException? error;
  const EditAccountState({
    required this.user,
    this.error,
  });

  @override
  List<Object> get props => [];
}

final class AccountLoading extends EditAccountState {
  const AccountLoading({
    required UserEntity user,
  }) : super(user: user);
}

final class AccountLoaded extends EditAccountState {
  const AccountLoaded({
    required UserEntity user,
  }) : super(user: user);
}

final class AccountError extends EditAccountState {
  const AccountError({
    required UserEntity user,
    required DioException error,
  }) : super(user: user, error: error);
}
