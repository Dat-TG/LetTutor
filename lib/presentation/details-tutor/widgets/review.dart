import 'package:flutter/material.dart';
import 'package:let_tutor/core/common/expanded_paragraph.dart';
import 'package:let_tutor/core/common/stars.dart';

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/hero_img.png'),
          radius: 25,
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "Phhai123",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  '4 months ago',
                  style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Stars(
              rating: 4,
              itemSize: 18,
            ),
            const SizedBox(
              height: 5,
            ),
            const ExpandedParagraph(text: 'Very great lesson!!!'),
          ],
        ),
      ],
    );
  }
}
