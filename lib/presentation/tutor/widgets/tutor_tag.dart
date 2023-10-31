import 'package:flutter/material.dart';
import 'package:let_tutor/core/providers/dark_mode_provider.dart';
import 'package:provider/provider.dart';

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
        color: Provider.of<DarkModeProvider>(context, listen: false)
                    .isDarkModeOn ==
                true
            ? Colors.black54
            : Colors.blue[50],
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
