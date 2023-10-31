import 'package:flutter/material.dart';
import 'package:let_tutor/presentation/details-course/widgets/question_mark.dart';

class CourseDetailsTitleSmall extends StatelessWidget {
  final String text;
  const CourseDetailsTitleSmall({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const QuestionMark(),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
