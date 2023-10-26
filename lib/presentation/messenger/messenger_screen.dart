import 'package:flutter/material.dart';
import 'package:let_tutor/core/common/appbar_normal.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/common/custom_textfield.dart';
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
      body: SingleChildScrollView(
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
            const MessengerConversation(),
            const MessengerConversation(),
            const MessengerConversation(),
            const MessengerConversation(),
            const MessengerConversation(),
          ],
        ),
      ),
    );
  }
}
