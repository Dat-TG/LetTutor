import 'package:flutter/material.dart';
import 'package:let_tutor/presentation/course/widgets/course_card.dart';

class AllCourses extends StatelessWidget {
  static const String routeName = 'allCourses';
  const AllCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: 20,
              ),
              child: CourseCard(isExpanded: true),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 20,
              ),
              child: CourseCard(isExpanded: true),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 20,
              ),
              child: CourseCard(isExpanded: true),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 20,
              ),
              child: CourseCard(isExpanded: true),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 20,
              ),
              child: CourseCard(isExpanded: true),
            ),
          ],
        ),
      ),
    );
  }
}