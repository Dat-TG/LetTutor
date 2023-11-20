import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:let_tutor/core/common/appbar_normal.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:let_tutor/core/common/expanded_paragraph.dart';
import 'package:let_tutor/core/utils/constants.dart';
import 'package:let_tutor/core/utils/helpers.dart';
import 'package:let_tutor/presentation/details-course/bloc/course_details_bloc.dart';
import 'package:let_tutor/presentation/details-course/widgets/course_details_title_big.dart';
import 'package:let_tutor/presentation/details-course/widgets/course_details_title_small.dart';
import 'package:let_tutor/presentation/details-course/widgets/list_topics.dart';
import 'package:let_tutor/presentation/details-tutor/tutor_details.dart';
import 'package:let_tutor/presentation/lesson/lesson_screen.dart';

class CourseDetails extends StatefulWidget {
  static const String routeName = 'courseDetails';
  final String courseId;
  const CourseDetails({super.key, required this.courseId});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  void initState() {
    context.read<CourseDetailsBloc>().add(
          CourseDetailsFetching(
            courseId: widget.courseId,
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarNormal(title: AppLocalizations.of(context)!.courseDetails),
      ),
      body: BlocBuilder<CourseDetailsBloc, CourseDetailsState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          if (state is CourseDetailsLoading) {
            return const Center(
              child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                ),
              ),
            );
          }
          if (state is CourseDetailsFailed) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    state.error?.message ?? '',
                    style: TextStyle(color: Theme.of(context).iconTheme.color),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    state.error?.response?.statusMessage ?? '',
                    style: TextStyle(color: Theme.of(context).iconTheme.color),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: state.courseDetailsEntity?.imageUrl ??
                      "https://images.unsplash.com/photo-1544377193-33dcf4d68fb5?ixlib=rb-4.0.3&q=85&fm=jpg&crop=entropy&cs=srgb",
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        strokeWidth: 1.5,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey,
                    width: double.infinity,
                    height: 200,
                  ),
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
                        state.courseDetailsEntity?.name ?? "",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ExpandedParagraph(
                        text: state.courseDetailsEntity?.description ?? "",
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
                              callback: () => GoRouter.of(context).pushNamed(
                                  LessonScreen.routeName,
                                  extra: state.courseDetailsEntity,
                                  pathParameters: {'index': '0'}),
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
                          text:
                              AppLocalizations.of(context)!.whyTakeThisCourse),
                      const SizedBox(
                        height: 5,
                      ),
                      ExpandedParagraph(
                          text: state.courseDetailsEntity?.reason ?? ""),
                      const SizedBox(
                        height: 10,
                      ),
                      CourseDetailsTitleSmall(
                          text: AppLocalizations.of(context)!
                              .whatWillYouBeAbleToDo),
                      const SizedBox(
                        height: 5,
                      ),
                      ExpandedParagraph(
                          text: state.courseDetailsEntity?.purpose ?? ""),
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
                          Text(
                            AppConstants.courseLevels[int.parse(
                                    state.courseDetailsEntity?.level ?? "0")] ??
                                "",
                            style: const TextStyle(
                              fontSize: 18,
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
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        '${state.courseDetailsEntity?.topics?.length} ',
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
                for (int i = 0;
                    i < (state.courseDetailsEntity?.users?.length ?? 0);
                    i++)
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).pushNamed(TutorDetails.routeName,
                          pathParameters: {
                            'id': state.courseDetailsEntity?.users?[i].id ?? ''
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        bottom: 20,
                      ),
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: state
                                    .courseDetailsEntity?.users?[i].avatar ??
                                Helpers.avatarFromName(
                                    state.courseDetailsEntity?.users?[i].name),
                            imageBuilder: (context, imageProvider) =>
                                CircleAvatar(
                              radius: 30,
                              backgroundImage: imageProvider,
                            ),
                            placeholder: (context, url) => const CircleAvatar(
                              radius: 30,
                              child: SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 1,
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                CachedNetworkImage(
                              imageUrl: Helpers.avatarFromName(
                                  state.courseDetailsEntity?.users?[i].name),
                              imageBuilder: (context, imageProvider) =>
                                  CircleAvatar(
                                radius: 30,
                                backgroundImage: imageProvider,
                              ),
                              placeholder: (context, url) => const CircleAvatar(
                                radius: 30,
                                child: SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 1,
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const CircleAvatar(
                                radius: 30,
                                child: Icon(
                                  Icons.person,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Text(
                                  state.courseDetailsEntity?.users?[i].name ??
                                      "",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.network(
                                    Helpers.flagFromCountryCode(
                                        Helpers.contriesNameToCode[state
                                                .courseDetailsEntity
                                                ?.users?[i]
                                                .country] ??
                                            state.courseDetailsEntity?.users?[i]
                                                .country),
                                    width: 30,
                                    height: 20,
                                    semanticsLabel: state
                                        .courseDetailsEntity?.users?[i].country,
                                    placeholderBuilder:
                                        (BuildContext context) => const Center(
                                      child: Icon(
                                        Icons.flag,
                                        size: 20,
                                      ),
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    Helpers.countriesCodeToName[state
                                            .courseDetailsEntity
                                            ?.users?[i]
                                            .country
                                            ?.toUpperCase()] ??
                                        state.courseDetailsEntity?.users?[i]
                                            .country ??
                                        AppLocalizations.of(context)!.noCountry,
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
