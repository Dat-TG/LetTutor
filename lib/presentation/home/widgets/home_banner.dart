import 'package:flutter/material.dart';
import 'package:let_tutor/common/custom_button.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 245, 246, 255),
        shape: BoxShape.rectangle,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LEARN ENGLISH,',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'ANYTIME,',
                  style: TextStyle(
                    color: Theme.of(context).secondaryHeaderColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'ANYWHERE,',
                  style: TextStyle(
                    color: Theme.of(context).secondaryHeaderColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Start your 1-on-1',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '25 Minute Lessons today!',
                  style: TextStyle(
                    color: Theme.of(context).secondaryHeaderColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  title: 'BOOK A LESSON',
                  callback: () {},
                  backgroundColor: Theme.of(context).secondaryHeaderColor,
                  textSize: 16,
                  titleColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Image.asset(
              'assets/images/hero_img.png',
            ),
          ),
        ],
      ),
    );
  }
}
