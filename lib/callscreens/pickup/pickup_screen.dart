import 'dart:async';
import 'dart:ui';

import 'package:merchant/callscreens/videocallscreen.dart';
import 'package:merchant/callscreens/voicecallscreen.dart';
import 'package:merchant/constant/strings.dart';
import 'package:merchant/model/call.dart';
import 'package:merchant/permission/permissions.dart';
import 'package:merchant/resources/call_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:wakelock/wakelock.dart';

class PickupScreen extends StatefulWidget {
  final Call call;

  PickupScreen({
    Key? key,
    required this.call,
  }) : super(key: key);

  @override
  State<PickupScreen> createState() => _PickupScreenState();
}

class _PickupScreenState extends State<PickupScreen> {
  final CallMethods callMethods = CallMethods();

  Timer? _timer;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Wakelock.enable(); // Turn on wakelock feature till call is running
      //To Play Ringtone
      FlutterRingtonePlayer.play(
          android: AndroidSounds.ringtone,
          ios: IosSounds.electronic,
          looping: true,
          volume: 0.5,
          asAlarm: false);
      _timer = Timer(const Duration(milliseconds: 60 * 1000), _endCall);
    });
    super.initState();
  }

  @override
  void dispose() {
    FlutterRingtonePlayer.stop();
    _timer?.cancel();
    super.dispose();
  }

  _endCall() async {
    Wakelock.disable(); // Turn off wakelock feature after call end
    FlutterRingtonePlayer.stop(); // To Stop Ringtone
    await callMethods.endCall(call: widget.call);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.call.callerPic!),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.low)),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 100),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(children: [
                      const Text(
                        "Incoming...",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 50),
                      Container(
                        height: 250,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.1),
                            borderRadius: BorderRadius.circular(300.0)),
                        child: Center(
                          child: Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.2),
                                borderRadius: BorderRadius.circular(300.0)),
                            child: Center(
                              child: Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            widget.call.callerPic!),
                                        fit: BoxFit.cover,
                                        filterQuality: FilterQuality.low),
                                    borderRadius: BorderRadius.circular(100.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        widget.call.callerName!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 75),
                    ]),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () => _endCall(),
                child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      boxShadow: SHADOW,
                      borderRadius: BorderRadius.circular(100.0)),
                  child: Center(
                      child: Icon(Icons.call_end,
                          color: Colors.white, size: 19.0)),
                ),
              ),
              const SizedBox(width: 25),
              GestureDetector(
                onTap: () async {
                  if (await Permissions.cameraAndMicrophonePermissionsGranted()) {
                    FlutterRingtonePlayer.stop();
                    widget.call.type!
                        ? Get.off(() => VideoCallScreen(call: widget.call))
                        : Get.off(() => VoiceCallScreen(call: widget.call));
                  }
                },
                child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      boxShadow: SHADOW,
                      borderRadius: BorderRadius.circular(100.0)),
                  child: Center(
                      child: Icon(Icons.call, color: Colors.white, size: 19.0)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
