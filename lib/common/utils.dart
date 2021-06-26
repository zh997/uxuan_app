import 'package:flutter/material.dart';

class Utils {
  static Color getColor(String s) {
    String rgbColor = '000000';
    if (s.isNotEmpty) {
      rgbColor = s.substring(1, 7);
    }
    return Color(int.parse(rgbColor, radix: 16) + 0xFF000000);
  }
}
