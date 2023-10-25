import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:let_tutor/core/common/appbar_normal.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:let_tutor/core/common/expanded_paragraph.dart';
import 'package:let_tutor/presentation/details-course/widgets/course_details_title_big.dart';
import 'package:let_tutor/presentation/details-course/widgets/course_details_title_small.dart';
import 'package:let_tutor/presentation/details-course/widgets/list_topics.dart';
import 'package:let_tutor/presentation/lesson/lesson_screen.dart';
import 'package:let_tutor/presentation/tutor/widgets/tutor_card.dart';

class CourseDetails extends StatelessWidget {
  static const String routeName = 'courseDetails';
  const CourseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarNormal(title: AppLocalizations.of(context)!.courseDetails),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/course.png',
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Life in the Internet Age',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const ExpandedParagraph(
                    text:
                        'Let\'s discuss how technology is changing the way we live',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          title: AppLocalizations.of(context)!.discover,
                          textSize: 18,
                          borderRadius: 10,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          callback: () => GoRouter.of(context)
                              .pushNamed(LessonScreen.routeName),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CourseDetailsTitleBig(
                      text: AppLocalizations.of(context)!.overview),
                  const SizedBox(
                    height: 10,
                  ),
                  CourseDetailsTitleSmall(
                      text: AppLocalizations.of(context)!.whyTakeThisCourse),
                  const SizedBox(
                    height: 5,
                  ),
                  const ExpandedParagraph(
                      text:
                          'Our world is rapidly changing thanks to new technology, and the vocabulary needed to discuss modern life is evolving almost daily. In this course you will learn the most up-to-date terminology from expertly crafted lessons as well from your native-speaking tutor.'),
                  const SizedBox(
                    height: 10,
                  ),
                  CourseDetailsTitleSmall(
                      text:
                          AppLocalizations.of(context)!.whatWillYouBeAbleToDo),
                  const SizedBox(
                    height: 5,
                  ),
                  const ExpandedParagraph(
                      text:
                          'You will learn vocabulary related to timely topics like remote work, artificial intelligence, online privacy, and more. In addition to discussion questions, you will practice intermediate level speaking tasks such as using data to describe trends.'),
                  const SizedBox(
                    height: 20,
                  ),
                  CourseDetailsTitleBig(
                      text: AppLocalizations.of(context)!.experienceLevel),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.people_outline_rounded,
                        size: 30,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Intermediate',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CourseDetailsTitleBig(
                      text: AppLocalizations.of(context)!.courseLength),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.book_outlined,
                        size: 30,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      RichText(
                        text: TextSpan(
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            children: [
                              const TextSpan(
                                text: '9 ',
                              ),
                              TextSpan(
                                text: AppLocalizations.of(context)!.topics,
                              ),
                            ]),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CourseDetailsTitleBig(
                      text: AppLocalizations.of(context)!.listTopics),
                  const SizedBox(
                    height: 20,
                  ),
                  const ListTopics(),
                  const SizedBox(
                    height: 20,
                  ),
                  CourseDetailsTitleBig(
                      text: AppLocalizations.of(context)!.suggestedTutors),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            CarouselSlider(
              items: const [
                TutorCard(),
                TutorCard(),
                TutorCard(),
              ],
              options: CarouselOptions(
                height: 326,
                padEnds: false,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
