import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:let_tutor/core/providers/auth_provider.dart';
import 'package:let_tutor/core/providers/locale_provider.dart';
import 'package:let_tutor/core/utils/helpers.dart';
import 'package:let_tutor/core/utils/jitsi_meet_methods.dart';
import 'package:let_tutor/presentation/tutor/bloc/total_lesson_time_bloc.dart';
import 'package:let_tutor/presentation/tutor/bloc/upcoming_lesson_bloc.dart';
import 'package:let_tutor/presentation/tutor/widgets/countdown_timer.dart';
import 'package:provider/provider.dart';

class UpcomingLesson extends StatelessWidget {
  const UpcomingLesson({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.elliptical(50, 10),
          bottomRight: Radius.elliptical(50, 10),
        ),
      ),
      child: Column(
        children: [
          BlocBuilder<UpcomingLessonBloc, UpcomingLessonState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              if (state is UpcomingLessonLoading) {
                return const Center(
                  child: SizedBox(
                    width: 15,
                    height: 15,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.5,
                      color: Colors.white,
                    ),
                  ),
                );
              }
              if (state.upcomingLesson == null ||
                  (state.upcomingLesson!.scheduleDetailInfo!
                          .startPeriodTimestamp! <=
                      DateTime.now().millisecondsSinceEpoch)) {
                return Text(
                  AppLocalizations.of(context)!.noUpcomingLesson,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                );
              } else {
                final user = Provider.of<AuthProvider>(context, listen: false)
                    .authEntity
                    .user!;
                final DateTime startTime = DateTime.fromMillisecondsSinceEpoch(
                    state.upcomingLesson!.scheduleDetailInfo!
                        .startPeriodTimestamp!);
                return Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.upcomingLesson,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: DateFormat(
                                    "E, d MMM yyyy HH:mm",
                                    Provider.of<LocaleProvider>(context,
                                            listen: false)
                                        .locale
                                        ?.languageCode)
                                .format(startTime),
                          ),
                          TextSpan(
                            text:
                                ' - ${DateFormat("HH:mm", Provider.of<LocaleProvider>(context, listen: false).locale?.languageCode).format(DateTime.fromMillisecondsSinceEpoch(state.upcomingLesson!.scheduleDetailInfo!.endPeriodTimestamp!))}',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CountdownTimer(
                      dateTime: startTime,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      title: AppLocalizations.of(context)!.enterLessonRoom,
                      titleColor: Theme.of(context).primaryColor,
                      backgroundColor: Colors.white,
                      callback: () => JitsiMeetMethods.joinMeeting(
                        context,
                        roomNameOrUrl:
                            '${state.upcomingLesson?.userId}-${state.upcomingLesson?.scheduleDetailInfo?.scheduleInfo?.tutorId}',
                        subject:
                            '${state.upcomingLesson!.scheduleDetailInfo!.scheduleInfo!.tutorInfo!.name} Lesson Room',
                        userDisplayName: user.name ?? 'Student',
                        userEmail: user.email,
                        userAvatarUrl:
                            user.avatar ?? Helpers.avatarFromName(user.name),
                        nextLessonTime: startTime,
                      ),
                      textSize: 16,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      icon: Icon(
                        Icons.video_call_rounded,
                        size: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                );
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<TotalLessonTimeBloc, TotalLessonTimeState>(
            builder: (context, state) {
              if (state is TotalLessonTimeLoading) {
                return const Center(
                  child: SizedBox(
                    width: 15,
                    height: 15,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.5,
                      color: Colors.white,
                    ),
                  ),
                );
              }
              int hours = (state.totalLessonTime ?? 0) ~/ 60;
              int minutes = (state.totalLessonTime ?? 0) % 60;
              return RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AppLocalizations.of(context)!.totalLessonTime,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: ' $hours ',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: hours > 1
                          ? AppLocalizations.of(context)!.hours
                          : AppLocalizations.of(context)!.hour,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: ' $minutes ',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: minutes > 1
                          ? AppLocalizations.of(context)!.minutes
                          : AppLocalizations.of(context)!.minute,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
