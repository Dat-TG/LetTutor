part of 'message_bloc.dart';

sealed class MessageState extends Equatable {
  final List<MessageEntity>? messages;
  final DioException? error;
  const MessageState({
    this.messages,
    this.error,
  });

  @override
  List<Object?> get props => [messages, error];
}

final class MessageLoading extends MessageState {
  const MessageLoading();
}

final class MessageLoaded extends MessageState {
  const MessageLoaded({
    required List<MessageEntity> messages,
  }) : super(messages: messages);
}

final class MessageError extends MessageState {
  const MessageError({
    required DioException error,
  }) : super(error: error);
}
