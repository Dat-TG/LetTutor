import 'dart:math';

import 'package:flutter/material.dart';
import 'package:let_tutor/presentation/booking/widgets/time_row.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  List<TimeOfDay> times = [];
  List<String> status = ['booked', 'available', 'bookedByMe', 'notAvailable'];

  @override
  void initState() {
    times.add(const TimeOfDay(hour: 0, minute: 0));
    for (int hour = 0, minute = 25;
        hour * 60 + minute < 23 * 60 + 59;
        minute += 25) {
      if (minute > 59) {
        minute -= 60;
        hour += 1;
      }
      times.add(TimeOfDay(hour: hour, minute: minute));
      minute += 5;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < times.length; i++)
          TimeRow(
              time: times[i], status: status[Random().nextInt(status.length)])
      ],
    );
  }
}
