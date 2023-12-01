import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:let_tutor/core/providers/auth_provider.dart';
import 'package:let_tutor/core/providers/dark_mode_provider.dart';
import 'package:let_tutor/domain/usecases/message/get_message_by_user_id.dart';
import 'package:let_tutor/injection_container.dart';
import 'package:let_tutor/presentation/conversation/bloc/conversation_bloc.dart';
import 'package:let_tutor/presentation/conversation/widgets/message_input.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConversationBody extends StatefulWidget {
  final String userId;
  const ConversationBody({super.key, required this.userId});

  @override
  State<ConversationBody> createState() => _ConversationBodyState();
}

class _ConversationBodyState extends State<ConversationBody> {
  int showTimeAtIndex = -1;
  final ScrollController _controller = ScrollController();
  final token = sl<SharedPreferences>().getString("access-token") ?? "";

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
    context.read<ConversationBloc>().add(
          GetConversationEvent(
              params: GetMessagesByUserIdUsecaseParams(
                  token: token,
                  page: 1,
                  perPage: 25,
                  startTime: DateTime.now().millisecondsSinceEpoch,
                  userId: widget.userId)),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark =
        Provider.of<DarkModeProvider>(context, listen: false).isDarkModeOn ??
            (ThemeMode.system == ThemeMode.dark);
    return BlocConsumer<ConversationBloc, ConversationState>(
      listener: (context, state) {
        if (state is ConversationLoaded) {
          scrollToBottom();
        }
      },
      builder: (context, state) {
        if (state is ConversationLoading) {
          return const Center(
            child: SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                )),
          );
        }
        if (state is ConversationError) {
          return Center(
            child: Text(state.error?.message ?? "Error"),
          );
        }
        final me =
            Provider.of<AuthProvider>(context, listen: false).authEntity.user;
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                controller: _controller,
                itemCount: state.messages?.length ?? 0,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(
                        left: (state.messages![index].fromInfo!.id != me!.id)
                            ? 14
                            : 56,
                        right: (state.messages![index].fromInfo!.id != me.id)
                            ? 56
                            : 14,
                        top: 10,
                        bottom: 10),
                    child: Column(
                      crossAxisAlignment:
                          state.messages![index].fromInfo!.id != me.id
                              ? CrossAxisAlignment.start
                              : CrossAxisAlignment.end,
                      children: [
                        if (index == showTimeAtIndex)
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                bottom: 5,
                              ),
                              child: Text(DateFormat(null, 'en')
                                  .format(state.messages![index].createdAt!)),
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
                                color: (state.messages![index].fromInfo!.id !=
                                        me.id
                                    ? isDark
                                        ? Colors.grey[600]
                                        : Colors.grey.shade200
                                    : isDark
                                        ? Colors.blue[600]
                                        : Colors.blue[200]),
                              ),
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, top: 16, bottom: 16),
                              child: Text(
                                state.messages?[index].content ?? "",
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            MessageInput(onSend: (String message) {
              /*setState(() {
                messages.insert(
                  0,
                  ChatMessage(
                    messageContent: message,
                    messageType: 'sender',
                    time: DateTime.now(),
                  ),
                );
              });*/
            }),
          ],
        );
      },
    );
  }
}
