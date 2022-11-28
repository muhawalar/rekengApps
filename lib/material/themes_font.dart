import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rekeng_apps/material/themes_color.dart';

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

  static TextStyle heading4 = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: ColorApp.white,
  );

  static TextStyle heading5 = GoogleFonts.inter(
      fontSize: 32, fontWeight: FontWeight.w700, color: ColorApp.font);

  static TextStyle heading6 = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: ColorApp.font,
  );

  static TextStyle heading7 = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: ColorApp.primary,
  );

  static TextStyle caption = GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w600, color: ColorApp.white);

  static TextStyle caption2 = GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w500, color: ColorApp.white);

  static TextStyle caption3 = GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w500, color: ColorApp.font);

  static TextStyle value = GoogleFonts.inter(
      fontSize: 30, fontWeight: FontWeight.w700, color: ColorApp.white);

  static TextStyle value2 = GoogleFonts.inter(
      fontSize: 20, fontWeight: FontWeight.w600, color: ColorApp.white);

  static TextStyle value3 = GoogleFonts.inter(
      fontSize: 20, fontWeight: FontWeight.w600, color: ColorApp.font);

  static TextStyle action = GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w500, color: ColorApp.three);

  static TextStyle menu = GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w500, color: ColorApp.black);

  static TextStyle subtitle = GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w500, color: ColorApp.font);

  static TextStyle subtitle2 = GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w500, color: ColorApp.grey);

  static TextStyle subtitle3 = GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w400, color: ColorApp.font);

  static TextStyle subtitle4 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ColorApp.font,
    decoration: TextDecoration.underline,
  );

  static TextStyle subtitle5 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: ColorApp.font,
    // decoration: TextDecoration.underline,
  );

  static TextStyle subtitle6 = GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w500, color: ColorApp.grey);

  static TextStyle dayWeekunselected = GoogleFonts.inter(
      fontSize: 13, fontWeight: FontWeight.w400, color: ColorApp.font);

  static TextStyle dayWeekSelected = GoogleFonts.inter(
      fontSize: 13, fontWeight: FontWeight.w400, color: ColorApp.white);

  static TextStyle dropdownValue = GoogleFonts.inter(
      fontSize: 14, fontWeight: FontWeight.w500, color: ColorApp.font);

  static TextStyle countValue = GoogleFonts.inter(
      fontSize: 14, fontWeight: FontWeight.w500, color: ColorApp.primary);

  static TextStyle countValueRed = GoogleFonts.inter(
      fontSize: 14, fontWeight: FontWeight.w500, color: ColorApp.pengeluaran);

  static TextStyle countValue2 = GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w500, color: ColorApp.primary);

  static TextStyle countValue3 = GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w500, color: ColorApp.pengeluaran);
}
