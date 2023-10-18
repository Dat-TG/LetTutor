import 'package:flutter/material.dart';
import 'package:let_tutor/presentation/course/widgets/course_banner.dart';
import 'package:let_tutor/presentation/course/widgets/course_search.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CourseBanner(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: CourseSearch(),
          ),
        ],
      ),
    );
  }
}
