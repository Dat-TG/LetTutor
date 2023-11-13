import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:let_tutor/core/common/stars.dart';
import 'package:let_tutor/core/utils/helpers.dart';

class TutorBasicInfo extends StatelessWidget {
  final String name;
  final String? avatarUrl;
  final String? country;
  final double? rating;
  final int? totalFeedback;
  const TutorBasicInfo({
    super.key,
    required this.name,
    this.avatarUrl,
    this.country,
    this.rating,
    this.totalFeedback,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImage(
          imageUrl: avatarUrl ?? Helpers.avatarFromName(name),
          imageBuilder: (context, imageProvider) => CircleAvatar(
            radius: 40,
            backgroundImage: imageProvider,
          ),
          placeholder: (context, url) => const CircleAvatar(
            radius: 40,
            child: SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                strokeWidth: 1.5,
              ),
            ),
          ),
          errorWidget: (context, url, error) => CachedNetworkImage(
            imageUrl: Helpers.avatarFromName(name),
            imageBuilder: (context, imageProvider) => CircleAvatar(
              radius: 40,
              backgroundImage: imageProvider,
            ),
            placeholder: (context, url) => const CircleAvatar(
              radius: 32,
              child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                ),
              ),
            ),
            errorWidget: (context, url, error) => const CircleAvatar(
              radius: 40,
              child: Icon(Icons.person),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 160,
              child: Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.network(
                  Helpers.flagFromCountryCode(
                      Helpers.contriesNameToCode[country] ?? country),
                  width: 30,
                  height: 20,
                  semanticsLabel: country,
                  placeholderBuilder: (BuildContext context) => const Center(
                    child: Icon(
                      Icons.flag,
                      size: 20,
                    ),
                  ),
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  Helpers.countriesCodeToName[country?.toUpperCase()] ??
                      country ??
                      AppLocalizations.of(context)!.noCountry,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                rating != null
                    ? Stars(
                        rating: rating!,
                        itemSize: 18,
                      )
                    : Text(
                        AppLocalizations.of(context)!.noReviewsYet,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                const SizedBox(
                  width: 5,
                ),
                if (totalFeedback != null)
                  Text(
                    '($totalFeedback)',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
