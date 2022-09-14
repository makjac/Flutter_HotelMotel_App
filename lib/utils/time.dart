class Time {
  static int secondSinceEpoch(DateTime time) {
    return time.microsecondsSinceEpoch ~/ Duration.microsecondsPerSecond;
  }
}
