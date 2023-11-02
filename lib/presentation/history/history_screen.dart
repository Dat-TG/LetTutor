import 'package:flutter/material.dart';
import 'package:let_tutor/core/common/appbar_normal.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/presentation/details-course/widgets/course_details_title_big.dart';
import 'package:let_tutor/presentation/history/widgets/history_banner.dart';
import 'package:let_tutor/presentation/history/widgets/history_card.dart';

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
      body: const SingleChildScrollView(
        child: Column(
          children: [
            HistoryBanner(),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  CourseDetailsTitleBig(text: 'Sat, 21 Oct 23'),
                  SizedBox(
                    height: 20,
                  ),
                  HistoryCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
