import 'package:flutter/material.dart';

class BecomeTutorAttetion extends StatelessWidget {
  final String text;
  const BecomeTutorAttetion({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.blue,
        ),
        borderRadius: BorderRadius.circular(5),
        color: Colors.blue.withOpacity(0.2),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
        ),
      ),
    );
  }
}
