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
