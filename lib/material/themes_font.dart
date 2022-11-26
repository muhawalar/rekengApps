import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rekeng_apps/helper/themes_color.dart';

class FontStyle {
  static TextStyle heading = GoogleFonts.inter(
      fontSize: 14, fontWeight: FontWeight.w500, color: ColorApp.white);

  static TextStyle heading2 = GoogleFonts.inter(
      fontSize: 20, fontWeight: FontWeight.w600, color: ColorApp.white);

  static TextStyle heading3 = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: ColorApp.font,
  );

  static TextStyle caption = GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w600, color: ColorApp.white);

  static TextStyle value = GoogleFonts.inter(
      fontSize: 30, fontWeight: FontWeight.w700, color: ColorApp.white);

  static TextStyle value2 = GoogleFonts.inter(
      fontSize: 20, fontWeight: FontWeight.w600, color: ColorApp.white);

  static TextStyle action = GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w500, color: ColorApp.three);

  static TextStyle menu = GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w500, color: ColorApp.black);

  static TextStyle subtitle = GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w500, color: ColorApp.font);
}
