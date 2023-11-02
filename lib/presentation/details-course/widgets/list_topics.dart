import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:let_tutor/presentation/details-course/widgets/single_topic.dart';
import 'package:let_tutor/presentation/lesson/lesson_screen.dart';

class ListTopics extends StatelessWidget {
  const ListTopics({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> topics = [
      'The Internet',
      'Artificial Intelligence (AI)',
      'Social Media',
      'Internet Privacy',
      'Live Streaming',
      'Coding',
      'Technology Transforming Healthcare',
      'Smart Home Technology',
      'Remote Work - A Dream Job?',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < topics.length; i++)
          InkWell(
            onTap: () => GoRouter.of(context).pushNamed(LessonScreen.routeName),
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
              ),
              child: Row(
                children: [
                  Expanded(child: SingleTopic(no: i + 1, title: topics[i])),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
