// ignore_for_file: unnecessary_string_escapes, deprecated_member_use

import 'dart:async';
import 'dart:ui';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as rtclocalview;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as rtcremoteview;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:merchant/callscreens/time_view.dart';
import 'package:merchant/constant/strings.dart';
import 'package:merchant/model/call.dart';
import 'package:merchant/providers/user_provider.dart';
import 'package:merchant/resources/call_methods.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:wakelock/wakelock.dart';

class VideoCallScreen extends StatefulWidget {
  final Call call;

  const VideoCallScreen({
    Key? key,
    required this.call,
  }) : super(key: key);

  @override
  VideoCallScreenState createState() => VideoCallScreenState();
}

class VideoCallScreenState extends State<VideoCallScreen> {
  final CallMethods callMethods = CallMethods();

  UserProvider? userProvider;
  StreamSubscription? callStreamSubscription;
  late RtcEngine _engine;
  final GlobalKey<TimerViewState> _timerKey = GlobalKey();
  static final _users = <int>[];
  final _infoStrings = <String>[];
  bool muted = false;
  bool _mutedVideo = false;
  int? remoteID;
  bool _reConnectingRemoteView = false;
  bool _isFront = false;

  @override
  void initState() {
    super.initState();
    Wakelock.enable(); // Turn on wakelock feature till call is running
    addPostFrameCallback();
    initializeAgora();
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
    var configuration = VideoEncoderConfiguration();
    configuration.dimensions = VideoDimensions(width: 1920, height: 1080);
    configuration.orientationMode = VideoOutputOrientationMode.Adaptative;
    await _engine.setVideoEncoderConfiguration(configuration);
    // VideoEncoderConfiguration config = VideoEncoderConfiguration();
    // config.dimensions = const VideoDimensions(width: 1800, height: 1800);
    // config.frameRate = VideoFrameRate.Fps15;
    // config.bitrate = 140;
    // await _engine.setVideoEncoderConfiguration(config);
    // await _engine.setParameters(
    //     '''{\"che.video.lowBitRateStreamParameter\":{\"width\":320,\"height\":180,\"frameRate\":15,\"bitRate\":140}}''');
    await _engine.joinChannel(null, widget.call.channelId!, null, 0);
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
            // snapshot is null which means that call is hanged and documents are deleted
            Navigator.pop(context);
            break;

          default:
            break;
        }
      });
    });
  }

  /// Create agora sdk instance and initialize
  Future<void> _initRtcEngine() async {
    _engine = await RtcEngine.create(APP_ID);
    await _engine.enableVideo();
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
    }, userOffline: (uid, elapsed) async {
      if (elapsed == UserOfflineReason.Dropped) {
        Wakelock.disable();
      }
      callMethods.endCall(call: widget.call);
      setState(() {
        final info = 'onUserOffline: a: ${uid}, b: ${elapsed}';
        _infoStrings.add(info);
        remoteID = null;
        _timerKey.currentState?.cancelTimer();
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
    }, remoteVideoStats: (remoteVideoStats) {
      if (remoteVideoStats.receivedBitrate == 0) {
        setState(() {
          _reConnectingRemoteView = true;
        });
      } else {
        setState(() {
          _reConnectingRemoteView = false;
        });
      }
    }, connectionStateChanged: (type, reason) async {
      if (type == ConnectionStateType.Connected) {
        setState(() {
          _reConnectingRemoteView = false;
        });
      } else if (type == ConnectionStateType.Reconnecting) {
        setState(() {
          _reConnectingRemoteView = true;
        });
      }
    }));
  }

  /// Helper function to get list of native views
  List<Widget> _getRenderViews() {
    final List<StatefulWidget> list = [];
    list.add(const rtclocalview.SurfaceView());
    for (var uid in _users) {
      list.add(rtcremoteview.SurfaceView(
        uid: uid,
        channelId: widget.call.channelId!,
      ));
    }
    return list;
  }

  /// Video view wrapper
  Widget _videoView(view) {
    return Expanded(child: Container(child: view));
  }

  /// Video view row wrapper
  Widget _expandedVideoRow(List<Widget> views) {
    final wrappedViews = views.map<Widget>(_videoView).toList();
    return Expanded(
      child: Row(
        children: wrappedViews,
      ),
    );
  }

  /// Video layout wrapper
  Widget _viewRows() {
    final views = _getRenderViews();
    switch (views.length) {
      case 1:
        return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: widget.call.hasDialled!
                      ? NetworkImage(widget.call.receiverPic!)
                      : const NetworkImage(''),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.low)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Center(
              child: Container(
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
                                    : const NetworkImage(''),
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.low),
                            borderRadius: BorderRadius.circular(100.0)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      case 2:
        return Stack(
          children: <Widget>[
            Container(
              width: 130,
              height: 180,
              margin:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                      color: Colors.white,
                      width: 5.0,
                      style: BorderStyle.solid)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: _expandedVideoRow([views[0]]),
              ),
            ),
            _expandedVideoRow([views[1]]),
            _reConnectingRemoteView
                ? Container(
                    color: Colors.black.withAlpha(200),
                    child: Center(
                        child: Text(
                      "Reconnecting",
                      style: getCustomFont(
                          color: Colors.white,
                          size: 15.0,
                          weight: FontWeight.w500),
                    )))
                : SizedBox()
          ],
        );
      case 3:
        return Column(
          children: <Widget>[
            _expandedVideoRow(views.sublist(0, 2)),
            _expandedVideoRow(views.sublist(2, 3))
          ],
        );
      case 4:
        return Column(
          children: <Widget>[
            _expandedVideoRow(views.sublist(0, 2)),
            _expandedVideoRow(views.sublist(2, 4))
          ],
        );
      default:
    }
    return Container();
  }

  void _onToggleMute() {
    setState(() {
      muted = !muted;
    });
    _engine.muteLocalAudioStream(muted);
  }

  // void _onToggleMuteVideo() {
  //   setState(() {
  //     _mutedVideo = !_mutedVideo;
  //   });
  //   _engine.muteLocalVideoStream(_mutedVideo);
  // }

  void _onSwitchCamera() async {
    await _engine.switchCamera().then((value) => setState(() {
      _isFront = !_isFront;
    })).catchError((err) {});
  }

  /// Toolbar layout
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
  void dispose() {
    // clear users
    _users.clear();
    // destroy sdk
    _engine.leaveChannel();
    _engine.destroy();
    callStreamSubscription!.cancel();
    Wakelock.disable(); // Turn off wakelock feature after call end
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: TimerView(
                    () {},
                    key: _timerKey,
                  ),
                )),
            _viewRows(),
            _toolbar(),
          ],
        ),
      ),
    );
  }

  Future<bool> _onBackPressed(BuildContext context) async {
    return await callMethods.endCall(call: widget.call);
  }
}
