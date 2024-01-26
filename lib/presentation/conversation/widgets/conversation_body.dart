import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:let_tutor/core/providers/auth_provider.dart';
import 'package:let_tutor/core/providers/dark_mode_provider.dart';
import 'package:let_tutor/domain/entities/message/message_entity.dart';
import 'package:let_tutor/domain/usecases/message/get_message_by_user_id.dart';
import 'package:let_tutor/presentation/conversation/bloc/conversation_bloc.dart';
import 'package:let_tutor/presentation/conversation/widgets/message_input.dart';
import 'package:provider/provider.dart';

class ConversationBody extends StatefulWidget {
  final String userId;
  const ConversationBody({super.key, required this.userId});

  @override
  State<ConversationBody> createState() => _ConversationBodyState();
}

class _ConversationBodyState extends State<ConversationBody> {
  int showTimeAtIndex = -1;
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    context.read<ConversationBloc>().add(
          GetConversationEvent(
              params: GetMessagesByUserIdUsecaseParams(
                  page: 1,
                  perPage: 25,
                  startTime: DateTime.now().millisecondsSinceEpoch,
                  userId: widget.userId)),
        );
    _controller.addListener(() {
      if (_controller.offset >= _controller.position.maxScrollExtent &&
          !_controller.position.outOfRange) {
        // scroll to top (reverse) => load more
        print('Load more');
        context.read<ConversationBloc>().add(
              GetConversationEvent(
                  params: GetMessagesByUserIdUsecaseParams(
                      page: (context
                                  .read<ConversationBloc>()
                                  .state
                                  .params
                                  ?.page ??
                              0) +
                          1,
                      perPage: 25,
                      startTime: context
                              .read<ConversationBloc>()
                              .state
                              .params
                              ?.startTime ??
                          DateTime.now().millisecondsSinceEpoch,
                      userId: widget.userId)),
            );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark =
        Provider.of<DarkModeProvider>(context, listen: false).isDarkModeOn ??
            (ThemeMode.system == ThemeMode.dark);
    return BlocBuilder<ConversationBloc, ConversationState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if ((state is ConversationLoading) &&
            (state.messages?.isEmpty ?? true)) {
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
                key: const Key('messageList'),
                reverse: true,
                controller: _controller,
                itemCount: (state.messages?.length ?? 0) + 1,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  if (index == state.messages?.length) {
                    return (state is! ConversationDone)
                        ? Center(
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: CircularProgressIndicator(
                                strokeWidth: 1.5,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          )
                        : const SizedBox();
                  }
                  return Container(
                    key: ValueKey(state.messages?[index].id),
                    padding: EdgeInsets.only(
                        left: (state.messages?[index].fromInfo?.id != me?.id)
                            ? 14
                            : 56,
                        right: (state.messages?[index].fromInfo?.id != me?.id)
                            ? 56
                            : 14,
                        top: 10,
                        bottom: 10),
                    child: Column(
                      crossAxisAlignment:
                          state.messages?[index].fromInfo?.id != me?.id
                              ? CrossAxisAlignment.start
                              : CrossAxisAlignment.end,
                      children: [
                        if (index == showTimeAtIndex)
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                bottom: 5,
                              ),
                              child: Text(DateFormat(null, 'en').format(
                                  state.messages![index].createdAt!.toLocal())),
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
                                color: (state.messages?[index].fromInfo?.id !=
                                        me?.id
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
              context.read<ConversationBloc>().add(
                    SendMessage(
                      message: MessageEntity(
                        content: message,
                        fromInfo: ReceiverInfoEntity(id: me?.id),
                        toInfo: ReceiverInfoEntity(id: widget.userId),
                        createdAt: DateTime.now(),
                      ),
                    ),
                  );
            }),
          ],
        );
      },
    );
  }
}
