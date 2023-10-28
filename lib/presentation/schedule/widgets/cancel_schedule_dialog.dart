import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:let_tutor/core/common/custom_textfield.dart';

class CancelScheduleDialog extends StatefulWidget {
  const CancelScheduleDialog({super.key});

  @override
  State<CancelScheduleDialog> createState() => _CancelScheduleDialogState();
}

class _CancelScheduleDialogState extends State<CancelScheduleDialog> {
  final TextEditingController _noteController = TextEditingController();
  String reason = '';
  @override
  Widget build(BuildContext context) {
    final List<String> reasons = [
      AppLocalizations.of(context)!.rescheduleAtAnotherTime,
      AppLocalizations.of(context)!.busyAtThatTime,
      AppLocalizations.of(context)!.askedByTheTutor,
      AppLocalizations.of(context)!.other,
    ];
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      contentPadding: const EdgeInsets.all(20),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                splashRadius: 20,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close_rounded,
                  size: 30,
                  color: Colors.grey,
                ),
              ),
            ),
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://sandbox.api.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1684484879187.jpg'),
              radius: 30,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Keegan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppLocalizations.of(context)!.lessonTime,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              DateFormat().format(DateTime.now()),
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppLocalizations.of(context)!
                  .whatWasTheReasonYouCancelThisBooking,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            DropdownMenu<String>(
              width: MediaQuery.of(context).size.width - 20 * 2 - 30 * 2,
              initialSelection: null,
              onSelected: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  reason = value!;
                });
              },
              dropdownMenuEntries:
                  reasons.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: _noteController,
              labelText: AppLocalizations.of(context)!.note,
              maxLines: 3,
              margin: EdgeInsets.zero,
            ),
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
