import 'package:flutter/material.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MeetingAppBar extends StatelessWidget {
  const MeetingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      leadingWidth: 96,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              splashRadius: 20,
              icon: const Icon(Icons.arrow_back_ios_rounded,
                  size: 20, color: Colors.white),
              onPressed: () {} //() => Navigator.of(context).pop(),
              ),
          IconButton(
            onPressed: () {},
            splashRadius: 20,
            icon: const Icon(
              Icons.volume_up_outlined,
              size: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
            right: 10,
          ),
          child: CustomButton(
            title: AppLocalizations.of(context)!.end,
            callback: () {},
            backgroundColor: Colors.red,
            titleColor: Colors.white,
            textSize: 16,
            borderRadius: 5,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
          ),
        ),
      ],
      title: GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.meetingRoom,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
