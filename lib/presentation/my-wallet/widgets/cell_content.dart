import 'package:flutter/material.dart';

class CellContent extends StatelessWidget {
  final Widget content;
  const CellContent({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[50],
      ),
      alignment: Alignment.centerLeft,
      height: 50,
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: content,
    );
  }
}
