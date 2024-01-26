import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:let_tutor/core/common/expanded_paragraph.dart';
import 'package:let_tutor/core/providers/auth_provider.dart';
import 'package:let_tutor/core/providers/dark_mode_provider.dart';
import 'package:let_tutor/core/utils/constants.dart';
import 'package:let_tutor/core/utils/helpers.dart';
import 'package:let_tutor/domain/entities/schedule/schedule_entity.dart';
import 'package:let_tutor/presentation/conversation/conversation_screen.dart';
import 'package:let_tutor/presentation/details-tutor/tutor_details.dart';
import 'package:let_tutor/presentation/schedule/widgets/cancel_schedule_dialog.dart';
import 'package:let_tutor/presentation/schedule/widgets/edit_request_dialog.dart';
import 'package:let_tutor/presentation/tutor/widgets/tag_card.dart';
import 'package:let_tutor/core/utils/jitsi_meet_methods.dart';
import 'package:provider/provider.dart';

class SingleSchedule extends StatefulWidget {
  final ScheduleEntity schedule;
  const SingleSchedule({super.key, required this.schedule});

  @override
  State<SingleSchedule> createState() => _SingleScheduleState();
}

class _SingleScheduleState extends State<SingleSchedule> {
  Future<void> cancelBooking(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return CancelScheduleDialog(
          schedule: widget.schedule,
        );
      },
    );
  }

  Future<void> editRequest(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const EditRequestDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user =
        Provider.of<AuthProvider>(context, listen: false).authEntity.user;
    double timeDifference = DateTime.fromMillisecondsSinceEpoch(
            widget.schedule.scheduleDetailInfo?.startPeriodTimestamp ?? 0)
        .difference(DateTime.now())
        .inHours
        .toDouble();
    log('Time difference: $timeDifference');
    return Stack(
      children: [
        Container(
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
                        onTap: () => GoRouter.of(context)
                            .pushNamed(TutorDetails.routeName, pathParameters: {
                          'id': widget.schedule.scheduleDetailInfo?.scheduleInfo
                                  ?.tutorInfo?.id ??
                              '0'
                        }),
                        child: CachedNetworkImage(
                          imageUrl: widget.schedule.scheduleDetailInfo
                                  ?.scheduleInfo?.tutorInfo?.avatar ??
                              Helpers.avatarFromName(widget
                                  .schedule
                                  .scheduleDetailInfo
                                  ?.scheduleInfo
                                  ?.tutorInfo
                                  ?.name),
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
                            imageUrl: Helpers.avatarFromName(widget
                                .schedule
                                .scheduleDetailInfo
                                ?.scheduleInfo
                                ?.tutorInfo
                                ?.name),
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
                            onTap: () => GoRouter.of(context).pushNamed(
                                TutorDetails.routeName,
                                pathParameters: {
                                  'id': widget.schedule.scheduleDetailInfo
                                          ?.scheduleInfo?.tutorInfo?.id ??
                                      '0'
                                }),
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
                                  widget.schedule.scheduleDetailInfo
                                      ?.scheduleInfo?.tutorInfo?.country ??
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
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.requestForLesson,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Material(
                      child: InkWell(
                        onTap: () {
                          editRequest(context);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.edit_rounded,
                              size: 18,
                              color: Theme.of(context).primaryColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              AppLocalizations.of(context)!.edit,
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ExpandedParagraph(
                  text: (widget.schedule.studentRequest != null &&
                          widget.schedule.studentRequest!.isNotEmpty)
                      ? widget.schedule.studentRequest!
                      : AppLocalizations.of(context)!.noRequestForSchedule,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      title: AppLocalizations.of(context)!.goToMeeting,
                      titleColor: Colors.white,
                      callback: () {
                        print(
                            'token: ${widget.schedule.studentMeetingLink?.substring(13)}');
                        JitsiMeetMethods.joinMeeting(
                          context,
                          roomNameOrUrl:
                              '${user?.id}-${widget.schedule.scheduleDetailInfo?.scheduleInfo?.tutorId}',
                          serverUrl: AppConstants.meetingServerUrl,
                          subject:
                              '${widget.schedule.scheduleDetailInfo?.scheduleInfo?.tutorInfo?.name} Lesson Room',
                          userDisplayName: user?.name ?? 'Student',
                          userEmail: user?.email,
                          userAvatarUrl: user?.avatar ??
                              Helpers.avatarFromName(user?.name),
                          token:
                              widget.schedule.studentMeetingLink?.substring(13),
                          nextLessonTime: DateTime.fromMillisecondsSinceEpoch(
                              widget.schedule.scheduleDetailInfo
                                      ?.startPeriodTimestamp ??
                                  0),
                        );
                      },
                      textSize: 16,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      icon: const Icon(
                        Icons.video_call_rounded,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomButton(
                      title: AppLocalizations.of(context)!.message,
                      textSize: 16,
                      backgroundColor:
                          Provider.of<DarkModeProvider>(context, listen: false)
                                      .isDarkModeOn ==
                                  true
                              ? Colors.grey[600]!
                              : Colors.grey[300]!,
                      titleColor: Theme.of(context).iconTheme.color,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      callback: () {
                        GoRouter.of(context)
                            .pushNamed(ConversationScreen.routeName);
                      },
                      icon: Icon(
                        Icons.message_rounded,
                        color: Theme.of(context).iconTheme.color,
                        size: 20,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        if (timeDifference >= 2)
          Positioned(
            right: 10,
            top: 10,
            child: CustomButton(
              title: AppLocalizations.of(context)!.cancel,
              callback: () {
                cancelBooking(context);
              },
              backgroundColor: Colors.red,
              titleColor: Colors.white,
              borderRadius: 5,
              textSize: 16,
              icon: const Icon(
                Icons.cancel_presentation_rounded,
                size: 20,
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(5),
            ),
          ),
      ],
    );
  }
}
