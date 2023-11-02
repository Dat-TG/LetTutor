import 'package:flutter/material.dart';
import 'package:let_tutor/presentation/tutor/widgets/tutor_card.dart';

class AllTutors extends StatelessWidget {
  static const String routeName = 'allTutors';
  const AllTutors({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: 20,
              ),
              child: TutorCard(isExpanded: true),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 20,
              ),
              child: TutorCard(isExpanded: true),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 20,
              ),
              child: TutorCard(isExpanded: true),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 20,
              ),
              child: TutorCard(isExpanded: true),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 20,
              ),
              child: TutorCard(isExpanded: true),
            ),
          ],
        ),
      ),
    );
  }
}
