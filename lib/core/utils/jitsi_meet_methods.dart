import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:let_tutor/core/providers/locale_provider.dart';
import 'package:let_tutor/core/utils/helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class JitsiMeetMethods {
  static void joinMeeting(BuildContext context,
      {String? serverUrl,
      required String roomNameOrUrl,
      required String subject,
      String? token,
      bool isAudioMuted = true,
      bool isAudioOnly = false,
      bool isVideoMuted = true,
      required String userDisplayName,
      String? userEmail,
      String? userAvatarUrl,
      Map<String, Object>? featureFlags,
      DateTime? nextLessonTime}) async {
    // Define meetings options here
    featureFlags ??= {};
    var options = JitsiMeetingOptions(
      roomNameOrUrl: roomNameOrUrl,
      serverUrl: serverUrl ?? 'https://meet.lettutor.com',
      subject: subject,
      token: token,
      isAudioMuted: isAudioMuted,
      isAudioOnly: isAudioOnly,
      isVideoMuted: isVideoMuted,
      userDisplayName: userDisplayName,
      userEmail: userEmail,
      featureFlags: featureFlags,
      userAvatarUrl: userAvatarUrl,
    );

    Timer? timer;

    String locale = Provider.of<LocaleProvider>(context, listen: false)
            .locale
            ?.languageCode ??
        'en';

    debugPrint("JitsiMeetingOptions: $options");
    await JitsiMeetWrapper.joinMeeting(
      options: options,
      listener: JitsiMeetingListener(
        onOpened: () => debugPrint("onOpened"),
        onConferenceWillJoin: (url) {
          debugPrint("onConferenceWillJoin: url: $url");
        },
        onConferenceJoined: (url) {
          debugPrint("onConferenceJoined: url: $url");
          timer = Timer.periodic(const Duration(seconds: 1), (timer) {
            String strTimeUntil = Helpers.getUntilLessonTime(
                nextLessonTime ?? DateTime.now(), context);

            if (nextLessonTime!.millisecondsSinceEpoch <=
                DateTime.now().millisecondsSinceEpoch) {
              timer.cancel();
            } else {
              Fluttertoast.showToast(
                msg:
                    "$strTimeUntil ${AppLocalizations.of(context)!.untilLessonStart}\n(${DateFormat("EEEE, d MMMM y hh:mm", locale).format(nextLessonTime)})",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                backgroundColor: Colors.black.withOpacity(0.8),
                textColor: Colors.white,
                timeInSecForIosWeb: 1,
                fontSize: 16.0,
              );
            }
          });
        },
        onConferenceTerminated: (url, error) {
          debugPrint("onConferenceTerminated: url: $url, error: $error");
          if (timer != null) timer!.cancel();
          Fluttertoast.cancel();
        },
        onAudioMutedChanged: (isMuted) {
          debugPrint("onAudioMutedChanged: isMuted: $isMuted");
        },
        onVideoMutedChanged: (isMuted) {
          debugPrint("onVideoMutedChanged: isMuted: $isMuted");
        },
        onScreenShareToggled: (participantId, isSharing) {
          debugPrint(
            "onScreenShareToggled: participantId: $participantId, "
            "isSharing: $isSharing",
          );
        },
        onParticipantJoined: (email, name, role, participantId) {
          debugPrint(
            "onParticipantJoined: email: $email, name: $name, role: $role, "
            "participantId: $participantId",
          );
        },
        onParticipantLeft: (participantId) {
          debugPrint("onParticipantLeft: participantId: $participantId");
        },
        onParticipantsInfoRetrieved: (participantsInfo, requestId) {
          debugPrint(
            "onParticipantsInfoRetrieved: participantsInfo: $participantsInfo, "
            "requestId: $requestId",
          );
        },
        onChatMessageReceived: (senderId, message, isPrivate) {
          debugPrint(
            "onChatMessageReceived: senderId: $senderId, message: $message, "
            "isPrivate: $isPrivate",
          );
        },
        onChatToggled: (isOpen) => debugPrint("onChatToggled: isOpen: $isOpen"),
        onClosed: () {
          debugPrint("onClosed");
          if (timer != null) timer!.cancel();
          Fluttertoast.cancel();
        },
      ),
    );
  }
}
