import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Fonts {

  static final TextStyle headlineLarge = GoogleFonts.montserrat(
    fontSize: 32,
    height: 32 / 40,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle headlineSmall = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 24 / 32,
    color: Colors.white,
  );

  static final TextStyle bodyLarge = GoogleFonts.montserrat(
    fontSize: 16,
    height: 16 / 20,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static final TextStyle bodyMedium = GoogleFonts.montserrat(
    fontSize: 14,
    height: 14 / 20,
    fontWeight: FontWeight.w400,
    color: Colors.grey[800]!,
  );

}
