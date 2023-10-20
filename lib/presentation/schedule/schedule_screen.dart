import 'package:flutter/material.dart';
import 'package:let_tutor/presentation/details-course/widgets/course_details_title_big.dart';
import 'package:let_tutor/presentation/schedule/widgets/schedule_banner.dart';
import 'package:let_tutor/presentation/schedule/widgets/single_schedule.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          ScheduleBanner(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                CourseDetailsTitleBig(text: 'Sat, 21 Oct 23'),
                SizedBox(
                  height: 20,
                ),
                SingleSchedule(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
