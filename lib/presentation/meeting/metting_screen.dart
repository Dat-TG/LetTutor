import 'package:flutter/material.dart';
import 'package:let_tutor/presentation/meeting/widgets/meeting_appbar.dart';

class MeetingScreen extends StatelessWidget {
  const MeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: MeetingAppBar(),
      ),
      body: Center(
        child: Text(
          'Meeting',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
