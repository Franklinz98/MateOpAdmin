import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppFonts {
  static TextStyle nunitoRegular({@required double fontSize}) {
    return GoogleFonts.nunito(
      fontSize: fontSize,
    );
  }

  static TextStyle nunitoSemibold({@required double fontSize}) {
    return GoogleFonts.nunito(
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle nunitoBold({@required double fontSize}) {
    return GoogleFonts.nunito(
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
    );
  }
}
