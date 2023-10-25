import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:let_tutor/core/common/appbar_normal.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:let_tutor/core/common/video/single_video.dart';
import 'package:let_tutor/presentation/booking/book_lesson_screen.dart';
import 'package:let_tutor/presentation/course/widgets/course_card.dart';
import 'package:let_tutor/core/common/expanded_paragraph.dart';
import 'package:let_tutor/presentation/details-tutor/widgets/report_tutor.dart';
import 'package:let_tutor/presentation/details-tutor/widgets/review.dart';
import 'package:let_tutor/presentation/details-tutor/widgets/tutor_basic_info.dart';
import 'package:let_tutor/presentation/details-tutor/widgets/tutor_details_title.dart';
import 'package:let_tutor/presentation/tutor/widgets/tutor_tag.dart';

class TutorDetails extends StatefulWidget {
  static const String routeName = 'tutorDetails';
  const TutorDetails({super.key});

  @override
  State<TutorDetails> createState() => _TutorDetailsState();
}

class _TutorDetailsState extends State<TutorDetails> {
  Future<void> reportTutor(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const ReportTutor();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarNormal(title: AppLocalizations.of(context)!.tutorDetails),
      ),
      floatingActionButton: CustomButton(
        title: AppLocalizations.of(context)!.bookNow,
        callback: () {
          GoRouter.of(context).pushNamed(BookLessonScreen.routeName);
        },
        borderRadius: 20,
        textSize: 16,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        icon: const Icon(
          Icons.perm_contact_calendar_rounded,
          color: Colors.white,
          size: 20,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const TutorBasicInfo(),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          title: AppLocalizations.of(context)!.like,
                          callback: () {},
                          borderRadius: 10,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          textSize: 16,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomButton(
                          title: AppLocalizations.of(context)!.message,
                          backgroundColor: Colors.grey[300]!,
                          titleColor: Colors.black,
                          callback: () {},
                          borderRadius: 10,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          textSize: 16,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomButton(
                          title: AppLocalizations.of(context)!.report,
                          backgroundColor: Colors.grey[300]!,
                          titleColor: Colors.black,
                          callback: () => reportTutor(context),
                          borderRadius: 10,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          textSize: 16,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    constraints: const BoxConstraints(maxHeight: 300),
                    child: const SingleVideo(
                        videoURL:
                            'https://api.app.lettutor.com/video/4d54d3d7-d2a9-42e5-97a2-5ed38af5789avideo1627913015871.mp4'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TutorDetailsTitle(
                    text: AppLocalizations.of(context)!.about,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const ExpandedParagraph(
                    text:
                        'I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching podcasts on Youtube. My most memorable life experience would be living in and traveling around Southeast Asia.',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TutorDetailsTitle(
                    text: AppLocalizations.of(context)!.education,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const ExpandedParagraph(text: 'BA'),
                  const SizedBox(
                    height: 10,
                  ),
                  TutorDetailsTitle(
                    text: AppLocalizations.of(context)!.languages,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Wrap(
                    direction: Axis.horizontal,
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      TutorTag(name: 'English'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TutorDetailsTitle(
                    text: AppLocalizations.of(context)!.specialities,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Wrap(
                    direction: Axis.horizontal,
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      TutorTag(name: 'English for Business'),
                      TutorTag(name: 'Conversational'),
                      TutorTag(name: 'English for Kids'),
                      TutorTag(name: 'English for Business'),
                      TutorTag(name: 'Conversational'),
                      TutorTag(name: 'English for Kids'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TutorDetailsTitle(
                    text: AppLocalizations.of(context)!.suggestedCourses,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            CarouselSlider(
              items: const [
                CourseCard(),
                CourseCard(),
                CourseCard(),
                CourseCard(),
              ],
              options: CarouselOptions(
                height: 311,
                viewportFraction:
                    250 / (MediaQuery.of(context).size.width) + 0.05,
                padEnds: false,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  TutorDetailsTitle(
                    text: AppLocalizations.of(context)!.interests,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const ExpandedParagraph(
                      text:
                          'I am a fun, talkative person who loves to find out about others cultures and experience.'),
                  const SizedBox(
                    height: 10,
                  ),
                  TutorDetailsTitle(
                    text: AppLocalizations.of(context)!.teachingExperience,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const ExpandedParagraph(
                      text:
                          'Acadsoc - English Language Instruction Chinese based online English teaching platform. I taught EILTS as well as a wide age range of Children and adults of all levels. Sincewin - English Language Instruction Online English lessons for whole kindergarten classes. I taught basic phonics and vocabulary using songs, TPR and puppets'),
                  const SizedBox(
                    height: 20,
                  ),
                  TutorDetailsTitle(
                    text: AppLocalizations.of(context)!.othersReview,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Review(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Review(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Review(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Review(),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
