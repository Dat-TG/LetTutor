import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/presentation/course/bloc/course_bloc.dart';
import 'package:let_tutor/presentation/course/widgets/course_card.dart';
import 'package:let_tutor/presentation/course/widgets/course_not_found_widget.dart';

class AllCourses extends StatelessWidget {
  static const String routeName = 'allCourses';
  const AllCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: BlocBuilder<CourseBloc, CourseState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: (state.courses?.length ?? 0) + 1,
                itemBuilder: (context, index) {
                  if (index < (state.courses?.length ?? 0)) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        bottom: 30,
                      ),
                      child: CourseCard(
                        isExpanded: true,
                        course: state.courses![index],
                      ),
                    );
                  } else {
                    return (state is CourseNotFound)
                        ? const CourseNotFoundWidget()
                        : (state is CourseCompleted)
                            ? const SizedBox()
                            : const Center(
                                child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                              );
                  }
                });
          },
        ),
      ),
    );
  }
}
