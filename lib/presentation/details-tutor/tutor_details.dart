import 'package:flutter/material.dart';
import 'package:let_tutor/common/appbar_normal.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:let_tutor/common/custom_button.dart';
import 'package:let_tutor/common/video/single_video.dart';
import 'package:let_tutor/presentation/details-tutor/widgets/tutor_basic_info.dart';

class TutorDetails extends StatefulWidget {
  const TutorDetails({super.key});

  @override
  State<TutorDetails> createState() => _TutorDetailsState();
}

class _TutorDetailsState extends State<TutorDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarNormal(title: AppLocalizations.of(context)!.tutorDetails),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const TutorBasicInfo(),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    title: AppLocalizations.of(context)!.like,
                    callback: () {},
                    borderRadius: 10,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    textSize: 16,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomButton(
                    title: AppLocalizations.of(context)!.message,
                    backgroundColor: Colors.grey[300]!,
                    titleColor: Colors.black,
                    callback: () {},
                    borderRadius: 10,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    textSize: 16,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomButton(
                    title: AppLocalizations.of(context)!.report,
                    backgroundColor: Colors.grey[300]!,
                    titleColor: Colors.black,
                    callback: () {},
                    borderRadius: 10,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    textSize: 16,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              constraints: const BoxConstraints(maxHeight: 300),
              child: const SingleVideo(
                  videoURL:
                      'https://api.app.lettutor.com/video/4d54d3d7-d2a9-42e5-97a2-5ed38af5789avideo1627913015871.mp4'),
            ),
          ],
        ),
      ),
    );
  }
}
