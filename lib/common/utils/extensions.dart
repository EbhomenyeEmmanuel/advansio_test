import 'package:flutter/material.dart';

extension StringExtension on String {
  int toInt() => int.parse(this);

  double toDouble() => double.parse(this);

  DateTime toDateTime() => DateTime.parse(this);

  String titleCaseSingle() {
    if (isEmpty) return "";
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String defaultOnEmpty([String defaultValue = ""]) =>
      isEmpty ? defaultValue : this;

  String capitalize() => "${this[0].toUpperCase()}${this.substring(1)}";

  String prependNairaSign() {
    if (isEmpty) return "₦0";
    return '₦$this';
  }
}

extension NumberExtension on num {
  /// interpolate a value from one range to another
  double normalize(
      num min,
      num max, {
        lowerBound = 0,
        upperBound = 100,
      }) {
    if (this == 0) return 0;
    return (upperBound - lowerBound) * ((this - min) / (max - min)) +
        lowerBound;
  }

  String prependNairaSign() {
    return '₦$this';
  }

// String formatDecimalSeparator(){
//
// }
}

extension ContextExtension on BuildContext {
  double getHeight([double factor = 1]) {
    assert(factor != 0);
    return MediaQuery.of(this).size.height * factor;
  }

  double getWidth([double factor = 1]) {
    assert(factor != 0);
    return MediaQuery.of(this).size.width * factor;
  }

  double get height => getHeight();

  double get width => getWidth();

  TextTheme get textTheme => Theme.of(this).textTheme;
}