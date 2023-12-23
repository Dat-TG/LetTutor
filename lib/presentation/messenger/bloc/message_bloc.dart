import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/message/message_entity.dart';
import 'package:let_tutor/domain/usecases/message/get_receivers.dart';

part 'message_event.dart';
part 'message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final GetReceiversUsecase _getReceiversUsecase;
  MessageBloc(this._getReceiversUsecase)
      : super(const MessageLoaded(messages: [])) {
    on<GetListMessages>(onLoadMessage);
  }
  void onLoadMessage(GetListMessages event, Emitter<MessageState> emit) async {
    emit(const MessageLoading());
    final dataState = await _getReceiversUsecase();
    if (dataState is DataSuccess) {
      emit(MessageLoaded(messages: dataState.data!));
    } else if (dataState is DataFailed) {
      emit(MessageError(error: dataState.error!));
    }
  }
}
