import 'package:flutter/material.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';

class JitsiMeetMethods {
  static void joinMeeting(
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
      Map<String, Object>? featureFlags}) async {
    // Define meetings options here
    featureFlags ??= {};
    serverUrl ??= 'https://meet.lettutor.com';
    var options = JitsiMeetingOptions(
        roomNameOrUrl: roomNameOrUrl,
        serverUrl: serverUrl,
        subject: subject,
        token: token,
        isAudioMuted: isAudioMuted,
        isAudioOnly: isAudioOnly,
        isVideoMuted: isVideoMuted,
        userDisplayName: userDisplayName,
        userEmail: userEmail,
        featureFlags: featureFlags,
        userAvatarUrl: userAvatarUrl);

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
        },
        onConferenceTerminated: (url, error) {
          debugPrint("onConferenceTerminated: url: $url, error: $error");
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
        onClosed: () => debugPrint("onClosed"),
      ),
    );
  }
}
