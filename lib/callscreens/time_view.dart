import 'dart:async';

import 'package:merchant/constant/strings.dart';
import 'package:flutter/material.dart';

class TimerView extends StatefulWidget {
  final Function updateTimerStatus;

  const TimerView(this.updateTimerStatus, {Key? key}) : super(key: key);

  @override
  TimerViewState createState() => TimerViewState();
}

class TimerViewState extends State<TimerView> {
  Timer? _timer;
  int _counter = 0 * 60;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _counter++;
      });
    });
  }

  void cancelTimer() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _getResendVerificationButton();
  }

  Widget _getResendVerificationButton() => Text(
      '${getFormatDuration(Duration(seconds: _counter))}',
      style: getCustomFont(
          size: 14.0, color: Colors.white, weight: FontWeight.w400));

  String getFormatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  var twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  var twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  if (duration.inHours > 0) {
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds hrs";
  }
  return "$twoDigitMinutes:$twoDigitSeconds mins";
}
}
