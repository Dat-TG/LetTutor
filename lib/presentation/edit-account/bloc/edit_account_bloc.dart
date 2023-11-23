import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:let_tutor/core/providers/auth_provider.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/user/user_entity.dart';
import 'package:let_tutor/domain/usecases/user/get_user.dart';
import 'package:let_tutor/injection_container.dart';

part 'edit_account_event.dart';
part 'edit_account_state.dart';

class EditAccountBloc extends Bloc<EditAccountEvent, EditAccountState> {
  final GetUserUsecase _getUserUsecase;
  EditAccountBloc(this._getUserUsecase)
      : super(const AccountLoading(user: UserEntity())) {
    on<GetAccount>(onGetAccount);
  }
  void onGetAccount(GetAccount event, Emitter<EditAccountState> emit) async {
    emit(AccountLoading(user: state.user));
    final dataState = await _getUserUsecase(params: event.accessToken);
    if (dataState is DataSuccess && dataState.data != null) {
      sl<AuthProvider>().setUser(dataState.data!);
      emit(AccountLoaded(user: dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(AccountError(user: state.user, error: dataState.error!));
    }
  }
}
