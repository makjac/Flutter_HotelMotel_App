class Scale {
  static double textScale(double width, double max) {
    double scale = (width / 3) * 0.008;
    if (scale < max) {
      return scale;
    }
    return max;
  }
}
