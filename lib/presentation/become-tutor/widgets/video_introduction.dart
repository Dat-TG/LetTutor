import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:let_tutor/presentation/become-tutor/widgets/become_tutor_attention.dart';
import 'package:let_tutor/presentation/become-tutor/widgets/become_tutor_title.dart';
import 'package:let_tutor/utils/helpers.dart';

class VideoIntroduction extends StatefulWidget {
  const VideoIntroduction({super.key});

  @override
  State<VideoIntroduction> createState() => _VideoIntroductionState();
}

class _VideoIntroductionState extends State<VideoIntroduction> {
  File? video;
  void selectVideo() async {
    var res = await Helpers.pickVideo();
    setState(() {
      video = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            AppLocalizations.of(context)!.setUpYourTutorProfile,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/introvideo.jpg',
              ),
              radius: 40,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                AppLocalizations.of(context)!.introVideoGuide,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        BecomeTutorTitle(
          text: AppLocalizations.of(context)!.introductionVideo,
        ),
        const SizedBox(
          height: 20,
        ),
        BecomeTutorAttetion(
          text: AppLocalizations.of(context)!.introductionVideoTips,
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: CustomButton(
              title: AppLocalizations.of(context)!.chooseVideo,
              backgroundColor: Colors.white,
              titleColor: Theme.of(context).primaryColor,
              borderColor: Theme.of(context).primaryColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              callback: () {
                selectVideo();
              }),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
