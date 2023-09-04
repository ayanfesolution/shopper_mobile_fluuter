import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color.dart';

class CustomThemeData {
  static ThemeData appThemeData(BuildContext context) {
    return ThemeData(
      primarySwatch: customKPrimaryColor,
      primaryColor: kPRYCOLOUR,
      textTheme: GoogleFonts.interTextTheme(),
      fontFamily: GoogleFonts.inter().fontFamily,
    );
  }
}
