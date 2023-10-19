import 'package:flutter/material.dart';

class TutorDetailsTitle extends StatelessWidget {
  final String text;
  const TutorDetailsTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
