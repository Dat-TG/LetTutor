import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:let_tutor/presentation/details-course/bloc/course_details_bloc.dart';
import 'package:let_tutor/presentation/details-course/widgets/single_topic.dart';
import 'package:let_tutor/presentation/lesson/lesson_screen.dart';

class ListTopics extends StatelessWidget {
  const ListTopics({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseDetailsBloc, CourseDetailsState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0;
                i < (state.courseDetailsEntity?.topics?.length ?? 0);
                i++)
              InkWell(
                onTap: () => GoRouter.of(context).pushNamed(
                    LessonScreen.routeName,
                    extra: state.courseDetailsEntity,
                    pathParameters: {
                      "index": i.toString(),
                    }),
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: SingleTopic(
                              no: i + 1,
                              title:
                                  state.courseDetailsEntity?.topics?[i].name ??
                                      "")),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
