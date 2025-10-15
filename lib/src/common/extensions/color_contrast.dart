import 'dart:ui';

import 'package:flutter/material.dart';

extension ColorContrast on Color {
  /// Maximum value for a color channel (alpha, red, green, blue).
  static const int _maxChannelValue = 255;

  /// Mask to isolate a color channel (alpha, red, green, blue).
  static const int _channelMask = 0xFF;

  /// Returns the inverted color.
  Color get inverted => Color.fromARGB(
    _maxChannelValue,
    ((1 - r) * _maxChannelValue).round() & _channelMask,
    ((1 - g) * _maxChannelValue).round() & _channelMask,
    ((1 - b) * _maxChannelValue).round() & _channelMask,
  );
}
