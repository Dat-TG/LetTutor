import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:let_tutor/core/common/appbar_normal.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:let_tutor/core/common/video/single_video.dart';
import 'package:let_tutor/core/utils/constants.dart';
import 'package:let_tutor/core/utils/language_local.dart';
import 'package:let_tutor/injection_container.dart';
import 'package:let_tutor/presentation/booking/book_lesson_screen.dart';
import 'package:let_tutor/presentation/course/widgets/course_card.dart';
import 'package:let_tutor/core/common/expanded_paragraph.dart';
import 'package:let_tutor/presentation/details-tutor/bloc/tutor_details_bloc.dart';
import 'package:let_tutor/presentation/details-tutor/widgets/report_tutor.dart';
import 'package:let_tutor/presentation/details-tutor/widgets/review.dart';
import 'package:let_tutor/presentation/details-tutor/widgets/tutor_basic_info.dart';
import 'package:let_tutor/presentation/details-tutor/widgets/tutor_details_title.dart';
import 'package:let_tutor/presentation/tutor/widgets/tag_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TutorDetails extends StatefulWidget {
  static const String routeName = 'tutorDetails';
  final String tutorId;
  const TutorDetails({super.key, required this.tutorId});

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
  void initState() {
    context.read<TutorDetailsBloc>().add(TutorDetailsLoad(
        sl<SharedPreferences>().getString('access-token')!, widget.tutorId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarNormal(title: AppLocalizations.of(context)!.tutorDetails),
      ),
      floatingActionButton: CustomButton(
        title: ' ${AppLocalizations.of(context)!.bookNow}',
        callback: () {
          GoRouter.of(context).pushNamed(BookLessonScreen.routeName);
        },
        borderRadius: 20,
        textSize: 18,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        icon: const Icon(
          Icons.perm_contact_calendar_rounded,
          color: Colors.white,
          size: 20,
        ),
      ),
      body: BlocBuilder<TutorDetailsBloc, TutorDetailsState>(
        builder: (context, state) {
          if (state is TutorDetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is TutorDetailsError) {
            return const Center(
              child: Text('Error'),
            );
          }
          return SingleChildScrollView(
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
                      TutorBasicInfo(
                        name: state.tutorDetails?.user?.name ?? '',
                        country: state.tutorDetails?.user?.country ?? '',
                        avatarUrl: state.tutorDetails?.user?.avatar,
                        rating: state.tutorDetails?.rating,
                        totalFeedback: state.tutorDetails?.totalFeedback,
                      ),
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
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          maxHeight: 300,
                        ),
                        child: SingleVideo(
                            videoURL: state.tutorDetails?.video ?? ''),
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
                      ExpandedParagraph(
                        text: state.tutorDetails?.bio ?? '',
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
                      ExpandedParagraph(
                          text: state.tutorDetails?.education ?? ''),
                      const SizedBox(
                        height: 10,
                      ),
                      TutorDetailsTitle(
                        text: AppLocalizations.of(context)!.languages,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        spacing: 10,
                        runSpacing: 10,
                        children: (state.tutorDetails?.languages ?? "")
                            .split(",")
                            .map((e) => TagCard(
                                name: LanguageLocal().getDisplayLanguage(
                                    e.toLowerCase())["name"]))
                            .toList(),
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
                      Wrap(
                        direction: Axis.horizontal,
                        spacing: 10,
                        runSpacing: 10,
                        children: (state.tutorDetails?.specialties ?? "")
                            .split(",")
                            .map((e) => TagCard(
                                name: AppConstants.specialties[e] ?? ""))
                            .toList(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TutorDetailsTitle(
                        text: AppLocalizations.of(context)!.suggestedCourses,
                      ),
                      const SizedBox(
                        height: 20,
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
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
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
                        height: 20,
                      ),
                      TutorDetailsTitle(
                        text: AppLocalizations.of(context)!.interests,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ExpandedParagraph(
                          text: state.tutorDetails?.interests ?? ''),
                      const SizedBox(
                        height: 10,
                      ),
                      TutorDetailsTitle(
                        text: AppLocalizations.of(context)!.teachingExperience,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ExpandedParagraph(
                          text: state.tutorDetails?.experience ?? ''),
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
          );
        },
      ),
    );
  }
}
