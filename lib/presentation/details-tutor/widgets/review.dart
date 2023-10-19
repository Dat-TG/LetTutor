import 'package:flutter/material.dart';
import 'package:let_tutor/common/expanded_paragraph.dart';
import 'package:let_tutor/common/stars.dart';

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/hero_img.png'),
          radius: 25,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Phhai123",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '4 months ago',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Stars(
              rating: 4,
              itemSize: 18,
            ),
            SizedBox(
              height: 5,
            ),
            ExpandedParagraph(text: 'Very great lesson!!!'),
          ],
        ),
      ],
    );
  }
}
