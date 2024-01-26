import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:let_tutor/core/common/custom_textfield.dart';
import 'package:let_tutor/core/utils/helpers.dart';
import 'package:let_tutor/domain/entities/schedule/schedule_entity.dart';
import 'package:let_tutor/domain/repositories/schedule/schedule_repository.dart';
import 'package:let_tutor/presentation/schedule/bloc/schedule_bloc.dart';

class Reason {
  final int id;
  final String reason;
  Reason(this.id, this.reason);
}

class CancelScheduleDialog extends StatefulWidget {
  final ScheduleEntity schedule;
  const CancelScheduleDialog({
    super.key,
    required this.schedule,
  });

  @override
  State<CancelScheduleDialog> createState() => _CancelScheduleDialogState();
}

class _CancelScheduleDialogState extends State<CancelScheduleDialog> {
  final TextEditingController _noteController = TextEditingController();
  int reason = 0;
  @override
  Widget build(BuildContext context) {
    final List<Reason> reasons = [
      Reason(1, AppLocalizations.of(context)!.rescheduleAtAnotherTime),
      Reason(2, AppLocalizations.of(context)!.busyAtThatTime),
      Reason(3, AppLocalizations.of(context)!.askedByTheTutor),
      Reason(4, AppLocalizations.of(context)!.other),
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
            CachedNetworkImage(
              imageUrl: widget.schedule.scheduleDetailInfo?.scheduleInfo
                      ?.tutorInfo?.avatar ??
                  Helpers.avatarFromName(widget.schedule.scheduleDetailInfo
                          ?.scheduleInfo?.tutorInfo?.name ??
                      ''),
              imageBuilder: (context, imageProvider) => CircleAvatar(
                radius: 30,
                backgroundImage: imageProvider,
              ),
              placeholder: (context, url) => const CircleAvatar(
                radius: 30,
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => CachedNetworkImage(
                imageUrl: Helpers.avatarFromName(widget.schedule
                        .scheduleDetailInfo?.scheduleInfo?.tutorInfo?.name ??
                    ''),
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  radius: 30,
                  backgroundImage: imageProvider,
                ),
                placeholder: (context, url) => const CircleAvatar(
                  radius: 30,
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const CircleAvatar(
                  radius: 30,
                  child: Icon(
                    Icons.person,
                    size: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.schedule.scheduleDetailInfo?.scheduleInfo?.tutorInfo
                      ?.name ??
                  '',
              style: const TextStyle(
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
              DateFormat().format(
                DateTime.utc(
                  2023,
                  10,
                  29,
                  8,
                  25,
                  0,
                ),
              ),
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
            DropdownMenu<int>(
              width: MediaQuery.of(context).size.width - 20 * 2 - 30 * 2,
              initialSelection: null,
              onSelected: (int? value) {
                // This is called when the user selects an item.
                setState(() {
                  reason = value!;
                });
              },
              dropdownMenuEntries:
                  reasons.map<DropdownMenuEntry<int>>((Reason value) {
                return DropdownMenuEntry<int>(
                    value: value.id, label: value.reason);
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
            if (reason == 0) {
              Fluttertoast.showToast(
                msg: AppLocalizations.of(context)!
                    .pleaseSelectTheReasonYouCancelThisBooking,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
              );
              // Helpers.showSnackBar(
              //     context,
              //     AppLocalizations.of(context)!
              //         .pleaseSelectTheReasonYouCancelThisBooking);
              return;
            }
            context.read<ScheduleBloc>().add(
                  ScheduleCancelled(
                    CancelScheduleParams(
                      scheduleDetailId: widget.schedule.id!,
                      cancelReasonId: reason,
                      note: _noteController.text,
                    ),
                  ),
                );
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
