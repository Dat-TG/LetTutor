import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:let_tutor/core/providers/locale_provider.dart';
import 'package:let_tutor/presentation/details-course/widgets/course_details_title_big.dart';
import 'package:let_tutor/presentation/schedule/bloc/schedule_bloc.dart';
import 'package:let_tutor/presentation/schedule/widgets/schedule_banner.dart';
import 'package:let_tutor/presentation/schedule/widgets/schedule_not_found_widget.dart';
import 'package:let_tutor/presentation/schedule/widgets/single_schedule.dart';
import 'package:provider/provider.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScheduleBloc, ScheduleState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return ListView.builder(
            itemCount: (state.schedules?.length ?? 0) + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: ScheduleBanner(),
                );
              }
              if ((index == (state.schedules?.length ?? 0) + 1)) {
                return (state.schedules?.isNotEmpty ?? false)
                    ? state is! ScheduleComplete
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                bottom: 20,
                              ),
                              child: SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(
                                  strokeWidth: 1.5,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox()
                    : const ScheduleNotFoundWidget();
              }
              if (index == 1) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 30,
                        top: 10,
                      ),
                      child: CourseDetailsTitleBig(
                        text: DateFormat(
                                "E, d MMM yyyy",
                                Provider.of<LocaleProvider>(context,
                                        listen: false)
                                    .locale
                                    ?.languageCode)
                            .format(
                          DateTime.fromMillisecondsSinceEpoch(state
                              .schedules![0]
                              .scheduleDetailInfo!
                              .startPeriodTimestamp!),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 20,
                      ),
                      child: SingleSchedule(schedule: state.schedules![0]),
                    ),
                  ],
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Builder(builder: (context) {
                    final DateTime startTime =
                        DateTime.fromMillisecondsSinceEpoch(state
                            .schedules![index - 1]
                            .scheduleDetailInfo!
                            .startPeriodTimestamp!);
                    final DateTime startTimePrev =
                        DateTime.fromMillisecondsSinceEpoch(state
                            .schedules![index - 2]
                            .scheduleDetailInfo!
                            .startPeriodTimestamp!);
                    bool isSameDay = startTime.day == startTimePrev.day &&
                        startTime.month == startTimePrev.month &&
                        startTime.year == startTimePrev.year;
                    return isSameDay
                        ? Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              bottom: 30,
                              top: 10,
                            ),
                            child: CourseDetailsTitleBig(
                                text: DateFormat(
                                        "E, d MMM yyyy",
                                        Provider.of<LocaleProvider>(context,
                                                listen: false)
                                            .locale
                                            ?.languageCode)
                                    .format(startTime)),
                          )
                        : const SizedBox();
                  }),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 20,
                    ),
                    child:
                        SingleSchedule(schedule: state.schedules![index - 1]),
                  ),
                ],
              );
            });
      },
    );
  }
}
