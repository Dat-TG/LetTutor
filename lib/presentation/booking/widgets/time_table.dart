import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/core/providers/auth_provider.dart';
import 'package:let_tutor/presentation/booking/bloc/booking_bloc.dart';
import 'package:let_tutor/presentation/booking/widgets/time_row.dart';
import 'package:provider/provider.dart';

class TimeTable extends StatefulWidget {
  final DateTime selectedDate;
  const TimeTable({super.key, required this.selectedDate});

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  List<TimeOfDay> times = [];
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
    return BlocBuilder<BookingBloc, BookingState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
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
                  return status[2];
                } else {
                  return status[0];
                }
              } else {
                return status[1];
              }
            }
          }
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
              TimeRow(time: times[i], status: checkStatus(times[i]))
          ],
        );
      },
    );
  }
}
