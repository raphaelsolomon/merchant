// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:ui';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:merchant/constant/strings.dart';
import 'package:merchant/model/call.dart';
import 'package:merchant/providers/user_provider.dart';
import 'package:merchant/resources/call_methods.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class VoiceCallScreen extends StatefulWidget {
  final Call call;
  const VoiceCallScreen({Key? key, required this.call}) : super(key: key);

  @override
  State<VoiceCallScreen> createState() => _VoiceCallScreenState();
}

class _VoiceCallScreenState extends State<VoiceCallScreen> {
  final _infoStrings = <String>[];
  static final _users = <int>[];
  late RtcEngine _engine;
  int? remoteID;
  String calling = 'calling.....';
  bool muted = false;
  UserProvider? userProvider;
  StreamSubscription? callStreamSubscription;
  final CallMethods callMethods = CallMethods();

  @override
  void initState() {
    super.initState();
    addPostFrameCallback();
    initializeAgora();
  }

  @override
  void dispose() {
    // clear users
    _users.clear();
    // destroy sdk
    _engine.leaveChannel();
    _engine.destroy();
    callStreamSubscription!.cancel();
    super.dispose();
  }

  addPostFrameCallback() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      userProvider = Provider.of<UserProvider>(context, listen: false);

      callStreamSubscription = callMethods
          .callStream(uid: userProvider!.getUser.uid!)
          .listen((DocumentSnapshot ds) {
        // defining the logic
        switch (ds.data()) {
          case null:
            Navigator.pop(context);
            break;

          default:
            break;
        }
      });
    });
  }

  Future<void> initializeAgora() async {
    if (APP_ID.isEmpty) {
      setState(() {
        _infoStrings.add(
          'APP_ID missing, please provide your APP_ID in settings.dart',
        );
        _infoStrings.add('Agora Engine is not starting');
      });
      return;
    }

    await _initRtcEngine();
    await _engine.enableWebSdkInteroperability(true);
    await _engine.joinChannel(null, widget.call.channelId!, null, 0);
  }

  /// Create agora sdk instance and initialize
  Future<void> _initRtcEngine() async {
    RtcEngineContext context = RtcEngineContext(APP_ID);
    _engine = await RtcEngine.createWithContext(context);
    await _engine.disableVideo();
    await _engine.enableAudio();
    await _engine.setChannelProfile(ChannelProfile.Communication);
    _engine.setEventHandler(RtcEngineEventHandler(error: (err) {
      setState(() {
        final info = 'onError: $err';
        _infoStrings.add(info);
      });
    }, joinChannelSuccess: (String channel, int uid, int elapsed) {
      setState(() {
        final info = 'onJoinChannel: $channel, uid: $uid';
        _infoStrings.add(info);
      });
    }, userJoined: (int uid, int elapsed) {
      setState(() {
        final info = 'onUserJoined: $uid';
        _infoStrings.add(info);
        remoteID = uid;
        _users.add(uid);
        if (kDebugMode) {
          print(_users);
        }
      });
    }, userInfoUpdated: (int i, UserInfo userInfo) {
      setState(() {
        final info = 'onUpdatedUserInfo: ${userInfo.toString()}';
        _infoStrings.add(info);
      });
    }, rejoinChannelSuccess: (String string, int a, int b) {
      setState(() {
        final info = 'onRejoinChannelSuccess: $string';
        _infoStrings.add(info);
      });
    }, userOffline: (int a, b) {
      callMethods.endCall(call: widget.call);
      setState(() {
        final info = 'onUserOffline: a: ${a.toString()}, b: ${b.toString()}';
        _infoStrings.add(info);
      });
    }, localUserRegistered: (int i, String s) {
      setState(() {
        final info = 'onRegisteredLocalUser: string: s, i: ${i.toString()}';
        _infoStrings.add(info);
      });
    }, leaveChannel: (stat) {
      setState(() {
        _infoStrings.add('onLeaveChannel');
        _users.clear();
      });
    }, connectionLost: () {
      setState(() {
        const info = 'onConnectionLost';
        _infoStrings.add(info);
      });
    }, firstRemoteVideoFrame: (int uid, int width, int height, int elapsed) {
      setState(() {
        final info = 'firstRemoteVideo: $uid ${width}x $height';
        _infoStrings.add(info);
      });
    }));
  }

  Widget _toolbar() {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: _onToggleMute,
            shape: const CircleBorder(),
            elevation: 2.0,
            fillColor: muted ? Colors.blueAccent : Colors.white,
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              muted ? Icons.mic : Icons.mic_off,
              color: muted ? Colors.white : Colors.blueAccent,
              size: 20.0,
            ),
          ),
          RawMaterialButton(
            onPressed: () => callMethods.endCall(
              call: widget.call,
            ),
            shape: const CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.redAccent,
            padding: const EdgeInsets.all(18.0),
            child: const Icon(
              Icons.call_end,
              color: Colors.white,
              size: 35.0,
            ),
          ),
          RawMaterialButton(
            onPressed: _onSwitchCamera,
            shape: const CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.white,
            padding: const EdgeInsets.all(12.0),
            child: const Icon(
              Icons.switch_access_shortcut,
              color: Colors.blueAccent,
              size: 20.0,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: widget.call.hasDialled!
                        ? NetworkImage(widget.call.receiverPic!)
                        : NetworkImage(widget.call.callerPic!),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.low)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 35.0,),
                  Text(widget.call.hasDialled! ?'${widget.call.receiverName}': '${widget.call.callerName}', style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold
                  ), textAlign: TextAlign.center),
                  const SizedBox(height: 5.0,),
                  Text(calling, style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300,
                  ), textAlign: TextAlign.center),
                  const SizedBox(height: 40.0,),
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
                                    image: widget.call.hasDialled!
                                        ? NetworkImage(widget.call.receiverPic!)
                                        : NetworkImage(widget.call.callerPic!),
                                    fit: BoxFit.cover,
                                    filterQuality: FilterQuality.low),
                                borderRadius: BorderRadius.circular(100.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          _toolbar(),
        ],
      ),
    );
  }

  void _onToggleMute() {
    setState(() {
      muted = !muted;
    });
    _engine.muteLocalAudioStream(muted);
  }

  void _onSwitchCamera() {
    _engine.switchCamera();
  }
}
