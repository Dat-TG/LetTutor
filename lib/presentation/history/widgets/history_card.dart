import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:let_tutor/core/common/expanded_paragraph.dart';
import 'package:let_tutor/core/common/stars.dart';
import 'package:let_tutor/core/providers/dark_mode_provider.dart';
import 'package:let_tutor/core/utils/helpers.dart';
import 'package:let_tutor/domain/entities/schedule/schedule_entity.dart';
import 'package:let_tutor/presentation/details-tutor/tutor_details.dart';
import 'package:let_tutor/presentation/history/widgets/rating_dialog.dart';
import 'package:let_tutor/presentation/history/widgets/report_lesson_dialog.dart';
import 'package:let_tutor/presentation/tutor/widgets/tag_card.dart';
import 'package:provider/provider.dart';

class HistoryCard extends StatefulWidget {
  final ScheduleEntity schedule;
  const HistoryCard({super.key, required this.schedule});

  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  Future<void> reportLesson(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const ReportLessonDialog();
      },
    );
  }

  Future<void> ratingLesson(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const RatingDialog();
      },
    );
  }

  double? rating;

  @override
  void initState() {
    if (widget.schedule.feedbacks != null &&
        widget.schedule.feedbacks!.isNotEmpty) {
      rating = 0;
      for (int i = 0; i < (widget.schedule.feedbacks!.length); i++) {
        rating = (rating ?? 0) + (widget.schedule.feedbacks![i].rating ?? 0);
      }
      rating = (rating ?? 0) / (widget.schedule.feedbacks?.length ?? 1);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(
              0,
              0,
            ),
            blurRadius: 8,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).splashColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () =>
                        GoRouter.of(context).pushNamed(TutorDetails.routeName),
                    child: CachedNetworkImage(
                      imageUrl: widget.schedule.scheduleDetailInfo?.scheduleInfo
                              ?.tutorInfo?.avatar ??
                          Helpers.avatarFromName(widget
                              .schedule
                              .scheduleDetailInfo
                              ?.scheduleInfo
                              ?.tutorInfo
                              ?.name),
                      imageBuilder: (context, imageProvider) => CircleAvatar(
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
                      errorWidget: (context, url, error) => CachedNetworkImage(
                        imageUrl: Helpers.avatarFromName(widget.schedule
                            .scheduleDetailInfo?.scheduleInfo?.tutorInfo?.name),
                        imageBuilder: (context, imageProvider) => CircleAvatar(
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
                          child: Icon(Icons.person),
                        ),
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
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => GoRouter.of(context)
                            .pushNamed(TutorDetails.routeName),
                        child: Text(
                          widget.schedule.scheduleDetailInfo?.scheduleInfo
                                  ?.tutorInfo?.name ??
                              'Tutor Name',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.network(
                          Helpers.flagFromCountryCode(
                              Helpers.contriesNameToCode[widget
                                      .schedule
                                      .scheduleDetailInfo
                                      ?.scheduleInfo
                                      ?.tutorInfo
                                      ?.country] ??
                                  widget.schedule.scheduleDetailInfo
                                      ?.scheduleInfo?.tutorInfo?.country),
                          width: 30,
                          height: 20,
                          semanticsLabel: widget.schedule.scheduleDetailInfo
                              ?.scheduleInfo?.tutorInfo?.country,
                          placeholderBuilder: (BuildContext context) =>
                              const Center(
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
                          Helpers.countriesCodeToName[widget
                                  .schedule
                                  .scheduleDetailInfo
                                  ?.scheduleInfo
                                  ?.tutorInfo
                                  ?.country
                                  ?.toUpperCase()] ??
                              widget.schedule.scheduleDetailInfo?.scheduleInfo
                                  ?.tutorInfo?.country ??
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
            const SizedBox(
              height: 10,
            ),
            if (widget.schedule.scheduleDetailInfo?.startPeriodTimestamp !=
                null)
              Padding(
                padding: const EdgeInsets.only(
                  left: 1,
                ),
                child: Text(
                  Helpers.getTimeDifference(
                      context,
                      DateTime.fromMillisecondsSinceEpoch(widget.schedule
                              .scheduleDetailInfo?.startPeriodTimestamp ??
                          0),
                      DateTime.now()),
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                TagCard(
                    name: DateFormat("HH:mm").format(
                        DateTime.fromMillisecondsSinceEpoch(widget.schedule
                                .scheduleDetailInfo?.startPeriodTimestamp ??
                            0))),
                const Icon(
                  Icons.horizontal_rule_rounded,
                  size: 18,
                ),
                TagCard(
                    name: DateFormat("HH:mm").format(
                        DateTime.fromMillisecondsSinceEpoch(widget.schedule
                                .scheduleDetailInfo?.endPeriodTimestamp ??
                            0))),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppLocalizations.of(context)!.requestForLesson,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ExpandedParagraph(
              text: (widget.schedule.studentRequest != null &&
                      widget.schedule.studentRequest!.isNotEmpty)
                  ? widget.schedule.studentRequest!
                  : AppLocalizations.of(context)!.noRequestForLesson,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppLocalizations.of(context)!.rateStudent,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            (widget.schedule.classReview != null)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lesson status: ${widget.schedule.classReview?.lessonStatus?.status}',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Behavior: ',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Stars(
                            rating:
                                widget.schedule.classReview?.behaviorRating ??
                                    0,
                            itemSize: 20,
                          )
                        ],
                      ),
                      if (widget.schedule.classReview?.behaviorComment
                              ?.isNotEmpty ??
                          false)
                        const SizedBox(
                          height: 10,
                        ),
                      if (widget.schedule.classReview?.behaviorComment
                              ?.isNotEmpty ??
                          false)
                        ExpandedParagraph(
                            text:
                                widget.schedule.classReview!.behaviorComment!),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Listening: ',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Stars(
                            rating:
                                widget.schedule.classReview?.listeningRating ??
                                    0,
                            itemSize: 20,
                          )
                        ],
                      ),
                      if (widget.schedule.classReview?.listeningComment
                              ?.isNotEmpty ??
                          false)
                        const SizedBox(
                          height: 10,
                        ),
                      if (widget.schedule.classReview?.listeningComment
                              ?.isNotEmpty ??
                          false)
                        ExpandedParagraph(
                            text:
                                widget.schedule.classReview!.listeningComment!),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Speaking: ',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Stars(
                            rating:
                                widget.schedule.classReview?.speakingRating ??
                                    0,
                            itemSize: 20,
                          )
                        ],
                      ),
                      if (widget.schedule.classReview?.speakingComment
                              ?.isNotEmpty ??
                          false)
                        const SizedBox(
                          height: 10,
                        ),
                      if (widget.schedule.classReview?.speakingComment
                              ?.isNotEmpty ??
                          false)
                        ExpandedParagraph(
                            text:
                                widget.schedule.classReview!.speakingComment!),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Vocabulary: ',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Stars(
                            rating:
                                widget.schedule.classReview?.vocabularyRating ??
                                    0,
                            itemSize: 20,
                          )
                        ],
                      ),
                      if (widget.schedule.classReview?.vocabularyComment
                              ?.isNotEmpty ??
                          false)
                        const SizedBox(
                          height: 10,
                        ),
                      if (widget.schedule.classReview?.vocabularyComment
                              ?.isNotEmpty ??
                          false)
                        ExpandedParagraph(
                            text: widget
                                .schedule.classReview!.vocabularyComment!),
                    ],
                  )
                : ExpandedParagraph(
                    text: AppLocalizations.of(context)!.rateStudentNotYet),
            const SizedBox(
              height: 20,
            ),
            if (rating != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.rating,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Stars(
                      rating: rating!,
                      itemSize: 24,
                    ),
                  ],
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  title: rating != null
                      ? AppLocalizations.of(context)!.edit
                      : AppLocalizations.of(context)!.rateTutor,
                  titleColor: Colors.white,
                  callback: () {
                    ratingLesson(context);
                  },
                  textSize: 16,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  icon: const Icon(
                    Icons.rate_review_rounded,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomButton(
                  title: AppLocalizations.of(context)!.report,
                  titleColor: Theme.of(context).iconTheme.color,
                  textSize: 16,
                  backgroundColor:
                      Provider.of<DarkModeProvider>(context, listen: false)
                                  .isDarkModeOn ==
                              true
                          ? Colors.grey[600]!
                          : Colors.grey[300]!,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  callback: () {
                    reportLesson(context);
                  },
                  icon: Icon(
                    Icons.report_rounded,
                    size: 20,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
