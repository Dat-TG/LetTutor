part of 'conversation_bloc.dart';

sealed class ConversationEvent extends Equatable {
  const ConversationEvent();

  @override
  List<Object> get props => [];
}

final class GetConversationEvent extends ConversationEvent {
  final GetMessagesByUserIdUsecaseParams params;

  const GetConversationEvent({
    required this.params,
  });

  @override
  List<Object> get props => [params];
}
