import 'package:flutter/material.dart';

class RecomendedRow extends StatelessWidget {
  final Widget icon;
  final String title;
  final String routeName;
  const RecomendedRow(
      {super.key,
      required this.icon,
      required this.title,
      required this.routeName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            icon,
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        Text(
          'View more',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
