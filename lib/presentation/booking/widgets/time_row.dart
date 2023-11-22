import 'package:flutter/material.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/presentation/booking/widgets/booking_details.dart';

class TimeRow extends StatefulWidget {
  final TimeOfDay time;
  final String status;
  const TimeRow({super.key, required this.time, required this.status});

  @override
  State<TimeRow> createState() => _TimeRowState();
}

class _TimeRowState extends State<TimeRow> {
  Future<void> openBookingDetails(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const BookingDetails();
      },
    );
  }

  late TimeOfDay endTime;

  @override
  void initState() {
    endTime = TimeOfDay(
        hour: (widget.time.minute < 30)
            ? widget.time.hour
            : (widget.time.hour < 23)
                ? (widget.time.hour + 1)
                : 0,
        minute: (widget.time.minute < 30) ? (widget.time.minute + 30) : 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${widget.time.hour.toString().padLeft(2, '0')}:${widget.time.minute.toString().padLeft(2, '0')} - ${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')}',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            width: 50,
          ),
          Expanded(
            child: (widget.status == 'booked')
                ? CustomButton(
                    title: AppLocalizations.of(context)!.booked,
                    callback: null,
                    backgroundColor: Colors.grey[200]!,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    titleColor: Colors.black,
                  )
                : (widget.status == 'bookedByMe')
                    ? Text(
                        AppLocalizations.of(context)!.booked,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    : (widget.status == 'available')
                        ? CustomButton(
                            title: AppLocalizations.of(context)!.book,
                            callback: () {
                              openBookingDetails(context);
                            },
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                          )
                        : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
