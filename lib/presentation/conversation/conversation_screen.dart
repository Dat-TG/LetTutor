import 'package:flutter/material.dart';
import 'package:let_tutor/domain/entities/message/message_entity.dart';
import 'package:let_tutor/presentation/conversation/widgets/appbar_conversation.dart';
import 'package:let_tutor/presentation/conversation/widgets/conversation_body.dart';

class ConversationScreen extends StatelessWidget {
  static const String routeName = 'conversation';
  final ReceiverInfoEntity user;
  const ConversationScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBarConversation(
            user: user,
          )),
      body: ConversationBody(userId: user.id.toString()),
    );
  }
}
