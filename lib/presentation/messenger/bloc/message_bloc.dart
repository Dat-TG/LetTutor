import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/message/message_entity.dart';
import 'package:let_tutor/domain/usecases/message/get_receivers.dart';
import 'package:let_tutor/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final String token = sl<SharedPreferences>().getString('access-token') ?? "";
  final GetReceiversUsecase _getReceiversUsecase;
  MessageBloc(this._getReceiversUsecase)
      : super(const MessageLoaded(messages: [])) {
    on<GetListMessages>(onLoadMessage);
  }
  void onLoadMessage(GetListMessages event, Emitter<MessageState> emit) async {
    emit(const MessageLoading());
    final dataState = await _getReceiversUsecase(params: token);
    if (dataState is DataSuccess) {
      emit(MessageLoaded(messages: dataState.data!));
    } else if (dataState is DataFailed) {
      emit(MessageError(error: dataState.error!));
    }
  }
}
