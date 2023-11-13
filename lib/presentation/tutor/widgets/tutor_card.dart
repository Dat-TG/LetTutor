import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:let_tutor/core/common/stars.dart';
import 'package:let_tutor/core/utils/constants.dart';
import 'package:let_tutor/core/utils/helpers.dart';
import 'package:let_tutor/domain/entities/tutor/tutor_entity.dart';
import 'package:let_tutor/presentation/details-tutor/tutor_details.dart';
import 'package:let_tutor/presentation/tutor/widgets/tag_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TutorCard extends StatelessWidget {
  final bool isExpanded;
  final TutorEntity tutor;
  const TutorCard({super.key, this.isExpanded = false, required this.tutor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => GoRouter.of(context).pushNamed(TutorDetails.routeName,
              pathParameters: {'id': tutor.id ?? ''}),
          child: Container(
            width: isExpanded ? double.infinity : 300,
            height: isExpanded ? null : 326,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(
                    0,
                    0,
                  ),
                  blurRadius: 5,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).splashColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          tutor.avatar ?? Helpers.avatarFromName(tutor.name),
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        radius: 32,
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
                      errorWidget: (context, url, error) => CachedNetworkImage(
                        imageUrl: Helpers.avatarFromName(tutor.name),
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          radius: 32,
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
                        errorWidget: (context, url, error) =>
                            const CircleAvatar(
                          radius: 32,
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
                            tutor.name ?? 'User Name',
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
                                  Helpers.contriesNameToCode[tutor.country] ??
                                      tutor.country),
                              width: 30,
                              height: 20,
                              semanticsLabel: tutor.country,
                              placeholderBuilder: (BuildContext context) =>
                                  const Center(
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
                              Helpers.countriesCodeToName[
                                      tutor.country?.toUpperCase()] ??
                                  tutor.country ??
                                  AppLocalizations.of(context)!.noCountry,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        tutor.rating != null
                            ? Stars(
                                rating: tutor.rating!,
                                itemSize: 18,
                              )
                            : Text(
                                AppLocalizations.of(context)!.noReviewsYet,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                isExpanded
                    ? Wrap(
                        direction: Axis.horizontal,
                        spacing: 10,
                        runSpacing: 10,
                        children: tutor.specialties != null
                            ? tutor.specialties!.split(',').map((e) {
                                return TagCard(
                                    name: AppConstants.specialties[e] ?? '');
                              }).toList()
                            : [],
                      )
                    : Container(
                        constraints: const BoxConstraints(
                          minHeight: 78,
                          maxHeight: 78,
                        ),
                        child: SingleChildScrollView(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Wrap(
                            direction: Axis.horizontal,
                            spacing: 10,
                            runSpacing: 10,
                            children: tutor.specialties != null
                                ? tutor.specialties!.split(',').map((e) {
                                    return TagCard(
                                        name:
                                            AppConstants.specialties[e] ?? '');
                                  }).toList()
                                : [],
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Text(
                      tutor.bio ?? '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: TextStyle(
                        color: Theme.of(context).iconTheme.color,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: CustomButton(
                    title: AppLocalizations.of(context)!.bookNow,
                    callback: () {},
                    backgroundColor: Theme.of(context).splashColor,
                    titleColor: Theme.of(context).primaryColor,
                    borderRadius: 20,
                    textSize: 16,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    borderColor: Theme.of(context).primaryColor,
                    icon: Icon(
                      Icons.perm_contact_calendar_rounded,
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          right: 20,
          top: 10,
          child: tutor.isFavoriteTutor == true
              ? const Icon(
                  Icons.favorite_rounded,
                  color: Colors.red,
                  size: 30,
                )
              : Icon(
                  Icons.favorite_outline_rounded,
                  color: Theme.of(context).primaryColor,
                  size: 30,
                ),
        ),
      ],
    );
  }
}
