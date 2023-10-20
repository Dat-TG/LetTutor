import 'package:flutter/material.dart';
import 'package:let_tutor/presentation/schedule/widgets/schedule_banner.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ScheduleBanner(),
        ],
      ),
    );
  }
}
