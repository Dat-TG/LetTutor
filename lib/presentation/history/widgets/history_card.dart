import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:let_tutor/core/common/expanded_paragraph.dart';
import 'package:let_tutor/core/providers/dark_mode_provider.dart';
import 'package:let_tutor/presentation/details-tutor/tutor_details.dart';
import 'package:let_tutor/presentation/history/widgets/rating_dialog.dart';
import 'package:let_tutor/presentation/history/widgets/report_lesson_dialog.dart';
import 'package:let_tutor/presentation/tutor/widgets/tutor_tag.dart';
import 'package:provider/provider.dart';

class HistoryCard extends StatefulWidget {
  const HistoryCard({super.key});

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
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://sandbox.api.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1684484879187.jpg'),
                      radius: 30,
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
                        child: const Text(
                          'Keegan',
                          style: TextStyle(
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
                        Image.asset(
                          'assets/images/vietnam.png',
                          width: 30,
                          height: 20,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          AppLocalizations.of(context)!.vietnam,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
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
            const Text(
              ' 21/10/2023',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                TutorTag(name: '13:00'),
                Icon(
                  Icons.horizontal_rule_rounded,
                  size: 18,
                ),
                TutorTag(name: '13:25'),
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
            const ExpandedParagraph(
                text:
                    'You should respond to a lesson request as soon as possible so the student knows if they will have a lesson or not.'),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
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
            ExpandedParagraph(
                text: AppLocalizations.of(context)!.rateStudentNotYet),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  title: AppLocalizations.of(context)!.rateTutor,
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
