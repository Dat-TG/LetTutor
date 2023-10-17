import 'package:flutter/material.dart';

class TutorTag extends StatelessWidget {
  final String name;
  const TutorTag({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 16,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
