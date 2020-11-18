import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppFonts {
  static TextStyle nunitoRegular({@required double fontSize, Color color}) {
    return GoogleFonts.nunito(fontSize: fontSize, color: color);
  }

  static TextStyle nunitoSemibold({@required double fontSize, Color color}) {
    return GoogleFonts.nunito(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle nunitoBold({@required double fontSize, Color color}) {
    return GoogleFonts.nunito(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w700,
    );
  }
}
