import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:let_tutor/core/common/appbar_normal.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/providers/locale_provider.dart';
import 'package:let_tutor/presentation/details-course/widgets/course_details_title_big.dart';
import 'package:let_tutor/presentation/history/bloc/history_bloc.dart';
import 'package:let_tutor/presentation/history/widgets/history_banner.dart';
import 'package:let_tutor/presentation/history/widgets/history_card.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  static const String routeName = 'history';
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarNormal(title: AppLocalizations.of(context)!.historyLesson),
      ),
      body: BlocBuilder<HistoryBloc, HistoryState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          if (state is HistoryLoading) {
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
          return ListView.builder(
            itemCount: (state.history?.length ?? 0) + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: HistoryBanner(),
                );
              }
              if (index == (state.history?.length ?? 0) + 1) {
                return Center(
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
                );
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
                          DateTime.fromMillisecondsSinceEpoch(state.history![0]
                              .scheduleDetailInfo!.startPeriodTimestamp!),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        bottom: 20,
                      ),
                      child: HistoryCard(schedule: state.history![0]),
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
                            .history![index - 1]
                            .scheduleDetailInfo!
                            .startPeriodTimestamp!);
                    final DateTime startTimePrev =
                        DateTime.fromMillisecondsSinceEpoch(state
                            .history![index - 2]
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
                    child: HistoryCard(schedule: state.history![index - 1]),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
