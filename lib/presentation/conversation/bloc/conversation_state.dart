part of 'conversation_bloc.dart';

sealed class ConversationState extends Equatable {
  final List<MessageEntity>? messages;
  final DioException? error;
  final GetMessagesByUserIdUsecaseParams? params;
  const ConversationState({
    this.messages,
    this.params,
    this.error,
  });

  @override
  List<Object?> get props => [messages, params, error];
}

final class ConversationInitial extends ConversationState {}

final class ConversationLoading extends ConversationState {
  const ConversationLoading({
    required List<MessageEntity> messages,
    required GetMessagesByUserIdUsecaseParams params,
  }) : super(messages: messages, params: params);

  @override
  List<Object?> get props => [messages, params];
}

final class ConversationLoaded extends ConversationState {
  const ConversationLoaded({
    required List<MessageEntity> messages,
    required GetMessagesByUserIdUsecaseParams params,
  }) : super(messages: messages, params: params);

  @override
  List<Object?> get props => [messages, params];
}

final class ConversationDone extends ConversationState {
  const ConversationDone({
    required List<MessageEntity> messages,
    required GetMessagesByUserIdUsecaseParams params,
  }) : super(messages: messages, params: params);

  @override
  List<Object?> get props => [messages, params];
}

final class ConversationError extends ConversationState {
  const ConversationError({
    required DioException error,
    required GetMessagesByUserIdUsecaseParams params,
    required List<MessageEntity> messages,
  }) : super(error: error, params: params, messages: messages);

  @override
  List<Object?> get props => [error, params];
}
