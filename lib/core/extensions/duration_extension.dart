import 'package:flutter/material.dart';

extension DurationExtension on BuildContext {
  Duration durationSeconds(int value) => Duration(seconds: value);
  Duration durationMilliseconds(int value) => Duration(milliseconds: value);
  Duration durationMilliseconds300() => const Duration(milliseconds: 300);
  Duration durationMilliseconds150() => const Duration(milliseconds: 150);
}
