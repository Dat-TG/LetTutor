import 'package:flutter/material.dart';

class ColumnLabel extends StatelessWidget {
  final String title;
  const ColumnLabel({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      color: Colors.grey[300],
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
