import 'package:flutter/material.dart';
import 'package:let_tutor/common/custom_button.dart';

class MeetingAppBar extends StatelessWidget {
  const MeetingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      leadingWidth: 96,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
              splashRadius: 20,
              icon: const Icon(Icons.arrow_back_ios_rounded,
                  size: 20, color: Colors.white),
              onPressed: () {} //() => Navigator.of(context).pop(),
              ),
          IconButton(
            onPressed: () {},
            splashRadius: 20,
            icon: const Icon(
              Icons.volume_up_outlined,
              size: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          child: CustomButton(
            title: 'Kết thúc',
            callback: () {},
            backgroundColor: Colors.red,
            titleColor: Colors.white,
            textSize: 16,
            borderRadius: 5,
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
            ),
          ),
        ),
      ],
      title: GestureDetector(
        onTap: () {},
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Meeting Room',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
