import 'package:flutter/material.dart';
import 'package:let_tutor/presentation/tutor/widgets/all_tutors.dart';
import 'package:let_tutor/presentation/tutor/widgets/tutor_search.dart';
import 'package:let_tutor/presentation/tutor/widgets/upcoming_lesson.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TutorScreen extends StatefulWidget {
  static const String routeName = 'tutorListScreen';
  const TutorScreen({super.key});

  @override
  State<TutorScreen> createState() => _TutorScreenState();
}

class _TutorScreenState extends State<TutorScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UpcomingLesson(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  size: 25,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.findATutor,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TutorSearch(),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              AppLocalizations.of(context)!.recommendedTutors,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const AllTutors(),
        ],
      ),
    );
  }
}
