
class TimingModel {
  String from;
  String to;

  TimingModel({required this.from, required this.to});

  setTimerFrom(from) {
    this.from = from;
  }

  setTimerTo(to) {
    this.to = to;
  }

  String get timerFrom => from;
  String get timerTo => to;
}
