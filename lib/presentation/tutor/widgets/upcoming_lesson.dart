import 'package:flutter/material.dart';

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
      child: const Column(
        children: [
          Text(
            'You have no upcoming lesson.',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Total lesson time is 506 hours 40 minutes',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
