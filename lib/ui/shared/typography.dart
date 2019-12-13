import 'package:flutter/material.dart';

class AppTypography {

  // Fonts will not scale below this point size.
  static final double minFontSize = 11.0;

  TextStyle get body => TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);
  TextStyle get bodyNormal => TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal);
  TextStyle get bodyMediumItalic => TextStyle(fontSize: 17.0, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic);
  TextStyle get bodyLarge => TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
}