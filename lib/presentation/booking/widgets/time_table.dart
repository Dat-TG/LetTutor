import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/core/providers/auth_provider.dart';
import 'package:let_tutor/core/utils/helpers.dart';
import 'package:let_tutor/presentation/booking/bloc/booking_bloc.dart';
import 'package:let_tutor/presentation/booking/widgets/time_row.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TimeTable extends StatefulWidget {
  final DateTime selectedDate;
  const TimeTable({super.key, required this.selectedDate});

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  List<TimeOfDay> times = [];
  List<int?> index = [];
  List<String> status = ['booked', 'available', 'bookedByMe', 'notAvailable'];

  @override
  void initState() {
    times.add(const TimeOfDay(hour: 0, minute: 0));
    for (int hour = 0, minute = 30;
        hour * 60 + minute < 23 * 60 + 59;
        minute += 30) {
      if (minute > 59) {
        minute -= 60;
        hour += 1;
      }
      times.add(TimeOfDay(hour: hour, minute: minute));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingBloc, BookingState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is BookingScheduleDone) {
          Helpers.showSnackBar(
              context, AppLocalizations.of(context)!.bookSuccessful);
          context
              .read<BookingBloc>()
              .add(BookingScheduleFetched(state.params!));
        }
        if (state is BookingScheduleFailed) {
          Helpers.showSnackBar(
              context, AppLocalizations.of(context)!.bookFailed);
          context
              .read<BookingBloc>()
              .add(BookingScheduleFetched(state.params!));
        }
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        index = [];
        String checkStatus(TimeOfDay time) {
          for (int i = 0; i < (state.schedule?.length ?? 0); i++) {
            DateTime startTime = DateTime.fromMillisecondsSinceEpoch(
                state.schedule?[i].startTimestamp ?? 0);
            if (widget.selectedDate.day == startTime.day &&
                widget.selectedDate.month == startTime.month &&
                widget.selectedDate.year == startTime.year &&
                startTime.hour == time.hour &&
                startTime.minute == time.minute) {
              if (state.schedule?[i].isBooked == true) {
                if (state.schedule?[i].scheduleDetails?[0].bookingInfo?[0]
                        .userId ==
                    Provider.of<AuthProvider>(context, listen: false)
                        .authEntity
                        .user
                        ?.id) {
                  index.add(null);
                  return status[2];
                } else {
                  index.add(null);
                  return status[0];
                }
              } else {
                if (startTime.compareTo(DateTime.now()) >= 0) {
                  index.add(i);
                  return status[1];
                }
                index.add(null);
                return status[0];
              }
            }
          }
          index.add(null);
          return status[3];
        }

        if (state is BookingLoadingTutorSchedule) {
          return Center(
            child: SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                  strokeWidth: 1.5,
                )),
          );
        }

        return Column(
          children: [
            for (int i = 0; i < times.length; i++)
              Builder(builder: (context) {
                String status = checkStatus(times[i]);
                return TimeRow(
                  time: times[i],
                  status: status,
                  schedule:
                      index[i] != null ? state.schedule![index[i]!] : null,
                );
              })
          ],
        );
      },
    );
  }
}
