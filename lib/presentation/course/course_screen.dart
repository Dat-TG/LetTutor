import 'package:flutter/material.dart';
import 'package:let_tutor/presentation/course/widgets/course_banner.dart';
import 'package:let_tutor/presentation/course/widgets/course_card.dart';
import 'package:let_tutor/presentation/course/widgets/course_search.dart';
import 'package:let_tutor/presentation/course/widgets/ebook_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                            : Colors.white,
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
                          color: index == 0 ? Colors.white : Colors.black,
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
                            : Colors.white,
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
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: index == 0
                ? const Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: [
                      CourseCard(
                        isExpanded: true,
                      ),
                      CourseCard(
                        isExpanded: true,
                      ),
                      CourseCard(
                        isExpanded: true,
                      ),
                      CourseCard(
                        isExpanded: true,
                      ),
                    ],
                  )
                : const Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: [
                      EbookCard(
                        isExpanded: true,
                      ),
                      EbookCard(
                        isExpanded: true,
                      ),
                      EbookCard(
                        isExpanded: true,
                      ),
                      EbookCard(
                        isExpanded: true,
                      ),
                    ],
                  ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
