import 'package:flutter/material.dart';

class AppColors {
  static Color primary = HexColor.fromHex('#265181');
  static Color primarySecond = HexColor.fromHex('#71bc56');
  static Color backgroundWhite = HexColor.fromHex('#71bc56');
  static Color black = HexColor.fromHex('#000000');
}

extension HexColor on Color {
  static Color fromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}
