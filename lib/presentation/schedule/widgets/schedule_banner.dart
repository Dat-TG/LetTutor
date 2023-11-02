import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:let_tutor/presentation/history/history_screen.dart';

class ScheduleBanner extends StatelessWidget {
  const ScheduleBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        shape: BoxShape.rectangle,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/schedule_banner.png',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  title: AppLocalizations.of(context)!.historyLesson,
                  titleColor: Theme.of(context).primaryColor,
                  borderColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.transparent,
                  icon: Icon(
                    Icons.history,
                    size: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                  callback: () {
                    GoRouter.of(context).pushNamed(HistoryScreen.routeName);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.scheduleUppercase,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  AppLocalizations.of(context)!.scheduleIntro1,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.4,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  AppLocalizations.of(context)!.scheduleIntro2,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
