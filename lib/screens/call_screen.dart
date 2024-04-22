import 'package:vidconf/util/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({
    super.key,
    required this.callID,
  });

  final String callID;

  @override
  Widget build(BuildContext context) {
    final currUser = FirebaseAuth.instance.currentUser;

    return SafeArea(
      child: ZegoUIKitPrebuiltCall(
        appID: Constants
            .APP_ID,
        appSign: Constants
            .APP_SIGN,
        userID: currUser?.uid ?? "guest-user",
        userName: currUser?.email ?? "guest_user",
        callID: callID,
        config: ZegoUIKitPrebuiltCallConfig.groupVideoCall()
          ..turnOnCameraWhenJoining = false
          ..turnOnMicrophoneWhenJoining = true
          ..memberListConfig = ZegoMemberListConfig(
            showCameraState: false,
            showMicrophoneState: false,
          ),
      ),
    );
  }
}
