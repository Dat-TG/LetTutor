import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScheduleNotFoundWidget extends StatelessWidget {
  const ScheduleNotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/tutor_not_found.png'),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppLocalizations.of(context)!.thereIsNoLessonScheduleYet,
          style: const TextStyle(
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
