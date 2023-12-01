import 'package:flutter/material.dart';
import 'package:let_tutor/presentation/conversation/widgets/appbar_conversation.dart';
import 'package:let_tutor/presentation/conversation/widgets/conversation_body.dart';

class ConversationScreen extends StatelessWidget {
  static const String routeName = 'conversation';
  final String userId;
  const ConversationScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(80), child: AppBarConversation()),
      body: ConversationBody(userId: userId),
    );
  }
}
