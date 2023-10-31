import 'package:flutter/material.dart';
import 'package:let_tutor/core/providers/dark_mode_provider.dart';
import 'package:provider/provider.dart';

class SingleTopic extends StatelessWidget {
  final int no;
  final String title;
  const SingleTopic({super.key, required this.no, required this.title});

  @override
  Widget build(BuildContext context) {
    bool isDark =
        Provider.of<DarkModeProvider>(context, listen: false).isDarkModeOn ??
            (ThemeMode.system == ThemeMode.dark);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          color: isDark ? Colors.grey[600]! : Colors.grey[200]!,
          border: Border.all(
            width: 0.5,
            color: Colors.grey,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$no.',
            style: TextStyle(
              fontSize: 18,
              color: isDark ? Colors.white : Colors.black54,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
