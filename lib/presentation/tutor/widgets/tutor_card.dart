import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:let_tutor/core/common/stars.dart';
import 'package:let_tutor/presentation/details-tutor/tutor_details.dart';
import 'package:let_tutor/presentation/tutor/widgets/tag_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TutorCard extends StatelessWidget {
  final bool isExpanded;
  const TutorCard({super.key, this.isExpanded = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => GoRouter.of(context).pushNamed(TutorDetails.routeName),
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
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://sandbox.api.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1684484879187.jpg'),
                      radius: 32,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 160,
                          child: Text(
                            'Keegan',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
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
                            Image.asset(
                              'assets/images/vietnam.png',
                              width: 30,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              AppLocalizations.of(context)!.vietnam,
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
                        const Stars(
                          rating: 4.5,
                          itemSize: 18,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                isExpanded
                    ? const Wrap(
                        direction: Axis.horizontal,
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          TagCard(name: 'English for Business'),
                          TagCard(name: 'Conversational'),
                          TagCard(name: 'English for Kids'),
                          TagCard(name: 'English for Business'),
                          TagCard(name: 'Conversational'),
                          TagCard(name: 'English for Kids'),
                        ],
                      )
                    : Container(
                        constraints: const BoxConstraints(
                          minHeight: 78,
                          maxHeight: 78,
                        ),
                        child: const SingleChildScrollView(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Wrap(
                            direction: Axis.horizontal,
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              TagCard(name: 'English for Business'),
                              TagCard(name: 'Conversational'),
                              TagCard(name: 'English for Kids'),
                              TagCard(name: 'English for Business'),
                              TagCard(name: 'Conversational'),
                              TagCard(name: 'English for Kids'),
                            ],
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'I am passionate about running and fitness, I often compete in trail/mountain running events and I love pushing myself. I am training to one day take part in ultra-endurance events. I also enjoy watching rugby on the weekends, reading and watching',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    style: TextStyle(
                      color: Theme.of(context).iconTheme.color,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
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
          child: Icon(
            Icons.favorite_outline_rounded,
            color: Theme.of(context).primaryColor,
            size: 30,
          ),
        ),
      ],
    );
  }
}
