import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:let_tutor/presentation/course/bloc/course_bloc.dart';
import 'package:let_tutor/presentation/course/bloc/ebook_bloc.dart';
import 'package:let_tutor/presentation/course/widgets/all_courses.dart';
import 'package:let_tutor/presentation/course/widgets/all_ebooks.dart';
import 'package:let_tutor/presentation/course/widgets/course_banner.dart';
import 'package:let_tutor/presentation/course/widgets/course_search.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  int index = 0;
  final ScrollController _scrollController = ScrollController();
  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      if (index == 0) {
        if (context.read<CourseBloc>().state is! CourseCompleted &&
            context.read<CourseBloc>().state is! CourseNotFound &&
            context.read<CourseBloc>().state is! CourseLoading) {
          // Load more data
          context.read<CourseBloc>().add(
                CourseFetching(
                    params: context.read<CourseBloc>().state.params!.copyWith(
                        page: (context.read<CourseBloc>().state.params?.page ??
                                0) +
                            1)),
              );
        }
      } else {
        if (context.read<EbookBloc>().state is! EbookCompleted &&
            context.read<EbookBloc>().state is! EbookNotFound &&
            context.read<EbookBloc>().state is! EbookLoading) {
          // Load more data
          context.read<EbookBloc>().add(
                EbookFetching(
                    params: context.read<EbookBloc>().state.params!.copyWith(
                        page: (context.read<EbookBloc>().state.params?.page ??
                                0) +
                            1)),
              );
        }
      }
    }
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CourseBanner(),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: CourseSearch(),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        index = 0;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: index == 0
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).splashColor,
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.course,
                        style: TextStyle(
                          fontSize: 18,
                          color: index == 0
                              ? Colors.white
                              : Theme.of(context).primaryColor,
                          fontWeight:
                              index == 0 ? FontWeight.w700 : FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        index = 1;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: index == 1
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).splashColor,
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 1,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.ebook,
                        style: TextStyle(
                          fontSize: 18,
                          color: index == 1
                              ? Colors.white
                              : Theme.of(context).primaryColor,
                          fontWeight:
                              index == 1 ? FontWeight.w700 : FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          index == 0 ? const AllCourses() : const AllEbooks(),
        ],
      ),
    );
  }
}
