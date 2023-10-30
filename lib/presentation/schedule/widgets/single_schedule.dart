import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:let_tutor/core/common/custom_button.dart';
import 'package:let_tutor/core/common/expanded_paragraph.dart';
import 'package:let_tutor/presentation/conversation/conversation_screen.dart';
import 'package:let_tutor/presentation/details-tutor/tutor_details.dart';
import 'package:let_tutor/presentation/schedule/widgets/cancel_schedule_dialog.dart';
import 'package:let_tutor/presentation/schedule/widgets/edit_request_dialog.dart';
import 'package:let_tutor/presentation/tutor/widgets/tutor_tag.dart';
import 'package:let_tutor/core/utils/jitsi_meet_methods.dart';

class SingleSchedule extends StatefulWidget {
  const SingleSchedule({super.key});

  @override
  State<SingleSchedule> createState() => _SingleScheduleState();
}

class _SingleScheduleState extends State<SingleSchedule> {
  Future<void> cancelBooking(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const CancelScheduleDialog();
      },
    );
  }

  Future<void> editRequest(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return const EditRequestDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(
                  0,
                  0,
                ),
                blurRadius: 8,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: () => GoRouter.of(context)
                            .pushNamed(TutorDetails.routeName),
                        child: const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://sandbox.api.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1684484879187.jpg'),
                          radius: 30,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () => GoRouter.of(context)
                                .pushNamed(TutorDetails.routeName),
                            child: const Text(
                              'Keegan',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
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
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  ' 21/10/2023',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    TutorTag(name: '13:00'),
                    Icon(
                      Icons.horizontal_rule_rounded,
                      color: Colors.black,
                      size: 18,
                    ),
                    TutorTag(name: '13:25'),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.requestForLesson,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Material(
                      child: InkWell(
                        onTap: () {
                          editRequest(context);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.edit_rounded,
                              size: 18,
                              color: Theme.of(context).primaryColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              AppLocalizations.of(context)!.edit,
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).primaryColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const ExpandedParagraph(
                    text:
                        'You should respond to a lesson request as soon as possible so the student knows if they will have a lesson or not.'),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                      title: AppLocalizations.of(context)!.goToMeeting,
                      titleColor: Colors.white,
                      callback: () => JitsiMeetMethods.joinMeeting(context,
                          roomNameOrUrl: (Random().nextInt(10000000) + 10000000)
                              .toString(),
                          subject: 'Lesson Room',
                          userDisplayName: 'Hai Pham',
                          userEmail: 'student@lettutor.com',
                          userAvatarUrl:
                              'https://sandbox.api.lettutor.com/avatar/f569c202-7bbf-4620-af77-ecc1419a6b28avatar1686033849227.jpeg'),
                      textSize: 16,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      icon: const Icon(
                        Icons.video_call_rounded,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomButton(
                      title: AppLocalizations.of(context)!.message,
                      titleColor: Colors.black,
                      textSize: 16,
                      backgroundColor: Colors.black12,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      callback: () {
                        GoRouter.of(context)
                            .pushNamed(ConversationScreen.routeName);
                      },
                      icon: const Icon(
                        Icons.message_rounded,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: CustomButton(
            title: AppLocalizations.of(context)!.cancel,
            callback: () {
              cancelBooking(context);
            },
            backgroundColor: Colors.red,
            titleColor: Colors.white,
            borderRadius: 5,
            textSize: 16,
            icon: const Icon(
              Icons.cancel_presentation_rounded,
              size: 20,
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(5),
          ),
        ),
      ],
    );
  }
}
