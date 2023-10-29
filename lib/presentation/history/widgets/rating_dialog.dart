import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:let_tutor/core/common/custom_textfield.dart';

class RatingDialog extends StatefulWidget {
  const RatingDialog({super.key});

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  final TextEditingController _noteController = TextEditingController();
  double rating = 5;
  @override
  Widget build(BuildContext context) {
    final List<String> ratingDescriptions = [
      AppLocalizations.of(context)!.terrible,
      AppLocalizations.of(context)!.bad,
      AppLocalizations.of(context)!.normal,
      AppLocalizations.of(context)!.good,
      AppLocalizations.of(context)!.wonderful,
    ];
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      actionsPadding: const EdgeInsets.only(
        bottom: 20,
        right: 25,
      ),
      titlePadding: EdgeInsets.zero,
      title: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.black12,
            ),
          ),
        ),
        padding: const EdgeInsets.only(
          left: 20,
          right: 10,
          top: 10,
          bottom: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                splashRadius: 20,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close_rounded,
                  size: 30,
                  color: Colors.grey,
                ),
              ),
            ),
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://sandbox.api.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1684484879187.jpg'),
              radius: 30,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Keegan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              AppLocalizations.of(context)!.lessonTime,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              DateFormat().format(
                DateTime.utc(
                  2023,
                  10,
                  29,
                  8,
                  25,
                  0,
                ),
              ),
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${AppLocalizations.of(context)!.whatIsYourRatingFor} Keegan?',
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: RatingBar.builder(
                initialRating: 5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20,
                ),
                onRatingUpdate: (value) {
                  setState(() {
                    rating = value;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                ratingDescriptions[rating.ceil() - 1],
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.amber,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: _noteController,
              alignLabelWithHint: true,
              labelText: AppLocalizations.of(context)!.contentReview,
              maxLines: 3,
              margin: EdgeInsets.zero,
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      actions: [
        CustomButton(
          title: AppLocalizations.of(context)!.cancel,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          borderRadius: 5,
          backgroundColor: Colors.grey[200]!,
          titleColor: Colors.black,
          callback: () {
            Navigator.pop(context);
          },
        ),
        const SizedBox(
          width: 10,
        ),
        CustomButton(
          title: AppLocalizations.of(context)!.submitReport,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          borderRadius: 5,
          callback: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
