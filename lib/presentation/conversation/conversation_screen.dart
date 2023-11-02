import 'package:flutter/material.dart';
import 'package:let_tutor/presentation/conversation/widgets/appbar_conversation.dart';
import 'package:let_tutor/presentation/conversation/widgets/conversation_body.dart';

class ConversationScreen extends StatelessWidget {
  static const String routeName = 'conversation';
  const ConversationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80), child: AppBarConversation()),
      body: ConversationBody(),
    );
  }
}
