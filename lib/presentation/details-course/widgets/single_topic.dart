import 'package:flutter/material.dart';

class SingleTopic extends StatelessWidget {
  final int no;
  final String title;
  const SingleTopic({super.key, required this.no, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
          border: Border.all(
            width: 0.5,
            color: Colors.grey,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$no.',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black54,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
