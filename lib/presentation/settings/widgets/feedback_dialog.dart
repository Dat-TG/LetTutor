import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:let_tutor/core/common/custom_textfield.dart';

class FeedbackDialog extends StatefulWidget {
  const FeedbackDialog({super.key});

  @override
  State<FeedbackDialog> createState() => _FeedbackDialogState();
}

class _FeedbackDialogState extends State<FeedbackDialog> {
  final TextEditingController _feedbackController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      actionsPadding: const EdgeInsets.only(
        bottom: 20,
        right: 25,
      ),
      titlePadding: EdgeInsets.zero,
      title: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.black12,
            ),
          ),
        ),
        padding: const EdgeInsets.only(
          left: 20,
          right: 10,
          top: 10,
          bottom: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppLocalizations.of(context)!.feedback),
            IconButton(
                splashRadius: 20,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close_rounded,
                  size: 30,
                  color: Colors.grey,
                ))
          ],
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              controller: _feedbackController,
              maxLines: 4,
              labelText: AppLocalizations.of(context)!.feedback,
              margin: EdgeInsets.zero,
              alignLabelWithHint: true,
            )
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      actions: [
        CustomButton(
          title: AppLocalizations.of(context)!.cancel,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          borderRadius: 5,
          backgroundColor: Colors.grey[200]!,
          titleColor: Colors.black,
          callback: () {
            Navigator.pop(context);
          },
        ),
        const SizedBox(
          width: 10,
        ),
        CustomButton(
          title: AppLocalizations.of(context)!.submitReport,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          borderRadius: 5,
          callback: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
