import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatMessage {
  final String messageContent;
  final String messageType;
  final DateTime time;
  ChatMessage(
      {required this.messageContent,
      required this.messageType,
      required this.time});
}

class ConversationBody extends StatefulWidget {
  const ConversationBody({super.key});

  @override
  State<ConversationBody> createState() => _ConversationBodyState();
}

class _ConversationBodyState extends State<ConversationBody> {
  int showTimeAtIndex = -1;
  final ScrollController _controller = ScrollController();
  List<ChatMessage> messages = [
    ChatMessage(
      messageContent: "Hello, Will",
      messageType: "receiver",
      time: DateTime.now(),
    ),
    ChatMessage(
      messageContent: "How have you been?",
      messageType: "receiver",
      time: DateTime.now(),
    ),
    ChatMessage(
      messageContent: "Hey Kriss, I am doing fine dude. wbu?",
      messageType: "sender",
      time: DateTime.now(),
    ),
    ChatMessage(
      messageContent: "ehhhh, doing OK.",
      messageType: "receiver",
      time: DateTime.now(),
    ),
    ChatMessage(
      messageContent: "Is there any thing wrong?",
      messageType: "sender",
      time: DateTime.now(),
    ),
    ChatMessage(
      messageContent: "Hello, Will",
      messageType: "receiver",
      time: DateTime.now(),
    ),
    ChatMessage(
      messageContent: "How have you been?",
      messageType: "receiver",
      time: DateTime.now(),
    ),
    ChatMessage(
      messageContent: "Hey Kriss, I am doing fine dude. wbu?",
      messageType: "sender",
      time: DateTime.now(),
    ),
    ChatMessage(
      messageContent: "ehhhh, doing OK.",
      messageType: "receiver",
      time: DateTime.now(),
    ),
    ChatMessage(
      messageContent: "Is there any thing wrong?",
      messageType: "sender",
      time: DateTime.now(),
    ),
  ].reversed.toList();

  void scrollToBottom() {
    if (_controller.hasClients) {
      _controller.animateTo(
        _controller.position.maxScrollExtent,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      controller: _controller,
      itemCount: messages.length,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Container(
          padding:
              const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: messages[index].messageType == 'receiver'
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.end,
            children: [
              if (index == showTimeAtIndex)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 5,
                    ),
                    child: Text(
                        DateFormat(null, 'vi').format(messages[index].time)),
                  ),
                ),
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  setState(() {
                    if (showTimeAtIndex != index) {
                      showTimeAtIndex = index;
                    } else {
                      showTimeAtIndex = -1;
                    }
                  });
                },
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (messages[index].messageType == "receiver"
                          ? Colors.grey.shade200
                          : Colors.blue[200]),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      messages[index].messageContent,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
