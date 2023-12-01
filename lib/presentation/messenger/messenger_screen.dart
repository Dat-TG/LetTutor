import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/core/common/appbar_normal.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/common/custom_textfield.dart';
import 'package:let_tutor/presentation/messenger/bloc/message_bloc.dart';
import 'package:let_tutor/presentation/messenger/widgets/messenger_conversation.dart';
import 'package:let_tutor/presentation/messenger/widgets/messenger_hotline.dart';

class MessengerScreen extends StatefulWidget {
  static const String routeName = 'messenger';
  const MessengerScreen({super.key});

  @override
  State<MessengerScreen> createState() => _MessengerScreenState();
}

class _MessengerScreenState extends State<MessengerScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarNormal(
          title: AppLocalizations.of(context)!.messenger,
        ),
      ),
      body: BlocBuilder<MessageBloc, MessageState>(
        builder: (context, state) {
          if (state is MessageLoading) {
            return Center(
              child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    strokeWidth: 1.5,
                    color: Theme.of(context).primaryColor,
                  )),
            );
          }
          if (state is MessageError) {
            return Center(
              child: Text(state.error?.message ?? "Error"),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 20,
                    right: 20,
                    bottom: 10,
                  ),
                  child: CustomTextField(
                    controller: _searchController,
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      size: 30,
                    ),
                    hintText: AppLocalizations.of(context)!.search,
                    borderRadius: 30,
                  ),
                ),
                const MessengerHotline(),
                for (int i = 0; i < state.messages!.length; i++)
                  MessengerConversation(message: state.messages![i]),
              ],
            ),
          );
        },
      ),
    );
  }
}
