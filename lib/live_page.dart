import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

import 'package:flutter_zego_livestreaming_sample_app/config_zego.dart';

class LivePage extends StatelessWidget {
  final String liveID;
  final bool isHost;
  final String userName;
  final String userId;

  const LivePage({
    Key? key,
    required this.liveID,
    required this.isHost,
    required this.userName,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveStreaming(
        appID: ConfigZego
            .appId, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign: ConfigZego
            .appSign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: userId,
        userName: userName,
        liveID: liveID,
        config: isHost
            ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
            : ZegoUIKitPrebuiltLiveStreamingConfig.audience(),
      ),
    );
  }
}
