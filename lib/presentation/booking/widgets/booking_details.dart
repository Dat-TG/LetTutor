import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/common/custom_textfield.dart';
import 'package:let_tutor/core/providers/auth_provider.dart';
import 'package:let_tutor/domain/entities/tutor_schedule/tutor_schedule_entity.dart';
import 'package:let_tutor/domain/repositories/tutor_schedule/tutor_schedule_repository.dart';
import 'package:let_tutor/injection_container.dart';
import 'package:let_tutor/presentation/booking/bloc/booking_bloc.dart';

class BookingDetails extends StatefulWidget {
  final ScheduleOfTutorEntity? schedule;
  const BookingDetails({super.key, this.schedule});

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.only(
        right: 30,
        bottom: 20,
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
            Text(AppLocalizations.of(context)!.bookingDetails),
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
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
              child: Text(
                AppLocalizations.of(context)!.bookingTime,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                  left: BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                  right: BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                  top: BorderSide(width: 0, color: Colors.grey),
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.purple[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '${DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(widget.schedule?.startTimestamp ?? 0))}-${DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(widget.schedule?.endTimestamp ?? 0))} ${DateFormat('EEEE, d MMMM y').format(DateTime.fromMillisecondsSinceEpoch(widget.schedule?.startTimestamp ?? 0))}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.purple[900]),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.balance,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      '${AppLocalizations.of(context)!.youHave} ${int.parse(sl<AuthProvider>().authEntity.user?.walletInfo?.amount ?? "0") ~/ 100000} ${AppLocalizations.of(context)!.lessonsLeft}',
                      style: TextStyle(fontSize: 16, color: Colors.purple[900]),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.price,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '1 ${AppLocalizations.of(context)!.lessonBookingDetails}',
                        style:
                            TextStyle(fontSize: 16, color: Colors.purple[900]),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: _noteController,
              maxLines: 4,
              labelText: AppLocalizations.of(context)!.note,
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
        BlocBuilder<BookingBloc, BookingState>(
          builder: (context, state) {
            return CustomButton(
              title: AppLocalizations.of(context)!.book,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              borderRadius: 5,
              callback: (state is BookingTutorScheduleDone)
                  ? () {
                      Navigator.pop(context);
                      if (DateTime.fromMillisecondsSinceEpoch(
                                  widget.schedule?.startTimestamp ?? 0)
                              .compareTo(DateTime.now()) >=
                          0) {
                        context.read<BookingBloc>().add(
                              BookingScheduleEvent(
                                BookingScheduleBody(
                                  note: _noteController.text,
                                  scheduleDetailIds: [
                                    widget.schedule?.scheduleDetails?[0].id ??
                                        ''
                                  ],
                                ),
                              ),
                            );
                      }
                    }
                  : null,
            );
          },
        ),
      ],
    );
  }
}
