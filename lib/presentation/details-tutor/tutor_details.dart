import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:let_tutor/core/common/appbar_normal.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:let_tutor/core/common/video/video_from_network.dart';
import 'package:let_tutor/core/utils/constants.dart';
import 'package:let_tutor/core/utils/helpers.dart';
import 'package:let_tutor/core/utils/language_local.dart';
import 'package:let_tutor/domain/repositories/review/review_repository.dart';
import 'package:let_tutor/presentation/booking/book_lesson_screen.dart';
import 'package:let_tutor/core/common/expanded_paragraph.dart';
import 'package:let_tutor/presentation/details-course/course_details.dart';
import 'package:let_tutor/presentation/details-tutor/bloc/review_bloc.dart';
import 'package:let_tutor/presentation/details-tutor/bloc/tutor_details_bloc.dart';
import 'package:let_tutor/presentation/details-tutor/widgets/report_tutor.dart';
import 'package:let_tutor/presentation/details-tutor/widgets/review.dart';
import 'package:let_tutor/presentation/details-tutor/widgets/tutor_basic_info.dart';
import 'package:let_tutor/presentation/details-tutor/widgets/tutor_details_title.dart';
import 'package:let_tutor/presentation/tutor/bloc/tutor_bloc.dart'
    hide FavoriteTutor;
import 'package:let_tutor/presentation/tutor/widgets/tag_card.dart';

class TutorDetails extends StatefulWidget {
  static const String routeName = 'tutorDetails';
  final String tutorId;
  final int? indexFromTutorBloc;
  const TutorDetails(
      {super.key, required this.tutorId, this.indexFromTutorBloc});

  @override
  State<TutorDetails> createState() => _TutorDetailsState();
}

class _TutorDetailsState extends State<TutorDetails> {
  Future<void> reportTutor(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return ReportTutor(
          parentContext: context,
        );
      },
    );
  }

  final ScrollController _scrollController = ScrollController();

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      if (context.read<ReviewBloc>().state is! ReviewsComplete) {
        // Load more data
        context.read<ReviewBloc>().add(
              ReviewFetched(
                context.read<ReviewBloc>().state.params!.copyWith(
                      page:
                          (context.read<ReviewBloc>().state.params!.page ?? 0) +
                              1,
                    ),
              ),
            );
      }
    }
  }

  @override
  void initState() {
    context.read<TutorDetailsBloc>().add(TutorDetailsLoad(widget.tutorId));
    context.read<ReviewBloc>().add(
          ReviewFetched(
            ReviewParams(
              page: 1,
              perPage: 10,
              tutorId: widget.tutorId,
            ),
          ),
        );
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarNormal(title: AppLocalizations.of(context)!.tutorDetails),
      ),
      floatingActionButton: CustomButton(
        title: ' ${AppLocalizations.of(context)!.bookNow}',
        callback: () {
          GoRouter.of(context)
              .pushNamed(BookLessonScreen.routeName, pathParameters: {
            'tutorId': widget.tutorId,
          });
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
      body: BlocConsumer<TutorDetailsBloc, TutorDetailsState>(
        listener: (context, state) {
          if (state is ReportTutorDone) {
            Helpers.showSnackBar(context, state.message!);
          }
        },
        buildWhen: (previous, current) => previous != current,
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
          return WillPopScope(
            onWillPop: () async {
              Future.delayed(Duration.zero, () {
                if (widget.indexFromTutorBloc != null) {
                  context.read<TutorBloc>().add(UpdateTutorFavoriteAtIndex(
                      widget.indexFromTutorBloc!,
                      state.tutorDetails?.isFavorite ?? false));
                }
              });
              return true;
            },
            child: SingleChildScrollView(
              controller: _scrollController,
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
                                title: (state.tutorDetails?.isFavorite ?? false)
                                    ? AppLocalizations.of(context)!.liked
                                    : AppLocalizations.of(context)!.like,
                                callback: () {
                                  context.read<TutorDetailsBloc>().add(
                                        FavoriteTutor(
                                          state.tutorDetails?.user?.id ?? '',
                                          context,
                                        ),
                                      );
                                },
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
                          child: VideoFromNetwork(
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
                  for (int i = 0;
                      i < (state.tutorDetails?.user?.courses?.length ?? 0);
                      i++)
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                        left: 20,
                        right: 20,
                      ),
                      child: InkWell(
                        onTap: () {
                          GoRouter.of(context).pushNamed(
                            CourseDetails.routeName,
                            pathParameters: {
                              'id': state.tutorDetails?.user?.courses?[i].id ??
                                  '',
                            },
                          );
                        },
                        child: Text(
                          state.tutorDetails?.user?.courses?[i].name ??
                              "Course",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
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
                        ExpandedParagraph(
                            text: state.tutorDetails?.interests ?? ''),
                        const SizedBox(
                          height: 10,
                        ),
                        TutorDetailsTitle(
                          text:
                              AppLocalizations.of(context)!.teachingExperience,
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
                        BlocBuilder<ReviewBloc, ReviewState>(
                          buildWhen: (previous, current) => previous != current,
                          builder: (context, state) {
                            return ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: (state.reviews?.length ?? 0) + 1,
                                itemBuilder: (context, index) {
                                  if (index < (state.reviews?.length ?? 0)) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 20,
                                      ),
                                      child: Review(
                                        avatarUrl: state
                                            .reviews![index].firstInfo?.avatar,
                                        content: state.reviews![index].content,
                                        name: state
                                            .reviews![index].firstInfo?.name,
                                        rating: state.reviews![index].rating,
                                        updatedAt:
                                            state.reviews![index].updatedAt,
                                      ),
                                    );
                                  } else {
                                    return (state is ReviewsComplete)
                                        ? const SizedBox(height: 40)
                                        : (state is ReviewFailed)
                                            ? Center(
                                                child: Text(
                                                  state.error?.response
                                                          ?.statusMessage ??
                                                      '',
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              )
                                            : const Center(
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                    bottom: 20,
                                                  ),
                                                  child: SizedBox(
                                                    width: 30,
                                                    height: 30,
                                                    child:
                                                        CircularProgressIndicator(
                                                      strokeWidth: 2,
                                                    ),
                                                  ),
                                                ),
                                              );
                                  }
                                });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
