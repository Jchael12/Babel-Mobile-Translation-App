import 'package:flutter/material.dart';
import 'package:translate/utils/colors.dart';

class ThemeManager {
  static bool isDarkMode = false;

  static const IconData _iconLight = Icons.wb_sunny;
  static const IconData _iconDark = Icons.nights_stay;
  static Color get navColor => isDarkMode ? vbg : mcgpalette0;

  static final ThemeData _lightTheme =
      ThemeData(primarySwatch: lightColor, brightness: Brightness.light);

  static final ThemeData _darkTheme =
      ThemeData(primarySwatch: vbg, brightness: Brightness.dark);

  static get lightTheme => _lightTheme;
  static get darkTheme => _darkTheme;

  static get iconDark => _iconDark;
  static get iconLight => _iconLight;

  static Color get appTheme => accent;
}
