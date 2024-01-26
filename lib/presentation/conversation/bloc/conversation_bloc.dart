import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:let_tutor/core/resources/data_state.dart';
import 'package:let_tutor/domain/entities/message/message_entity.dart';
import 'package:let_tutor/domain/usecases/message/get_message_by_user_id.dart';
import 'package:let_tutor/services/socket_services.dart';

part 'conversation_event.dart';
part 'conversation_state.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  final GetMessagesByUserIdUsecase _getMessagesByUserIdUsecase;
  final SocketServices socketServices;
  ConversationBloc(this._getMessagesByUserIdUsecase, this.socketServices)
      : super(ConversationInitial()) {
    on<GetConversationEvent>(onMessagesFetched);
    on<SendMessage>(onSendMessage);
  }

  void onMessagesFetched(
      GetConversationEvent event, Emitter<ConversationState> emit) async {
    emit(ConversationLoading(
      messages: state.messages ?? [],
      params: event.params,
    ));

    final dataState = await _getMessagesByUserIdUsecase(
      params: event.params,
    );

    print('Fetch messages: ${dataState.data.toString()}');

    if (dataState is DataSuccess) {
      if (dataState.data!.isNotEmpty) {
        if (event.params.page == 1) {
          emit(ConversationLoaded(
              messages: dataState.data ?? [], params: event.params));
        } else {
          emit(ConversationLoaded(
            messages: [...(state.messages ?? []), ...(dataState.data ?? [])],
            params: event.params,
          ));
        }
      } else {
        emit(ConversationDone(
          messages: state.messages ?? [],
          params: event.params,
        ));
      }
    }

    if (dataState is DataFailed) {
      emit(ConversationError(
        error: dataState.error!,
        messages: state.messages ?? [],
        params: event.params,
      ));
    }
  }

  void onSendMessage(SendMessage event, Emitter<ConversationState> emit) {
    emit(ConversationLoading(
      messages: state.messages ?? [],
      params: state.params!,
    ));

    Map<String, dynamic> data = {
      'fromId': event.message.fromInfo!.id,
      'toId': event.message.toInfo!.id,
      'content': event.message.content
    };

    socketServices.sendEvent('chat:sendMessage', data);

    print('send message: ${event.message}');

    emit(ConversationLoaded(
      messages: [event.message, ...(state.messages ?? [])],
      params: state.params!,
    ));
  }
}
