import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/presentation/tutor/bloc/total_lesson_time_bloc.dart';

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
          Text(
            AppLocalizations.of(context)!.noUpcomingLesson,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
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
