import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color purpleColor = const Color(0xff865DFF);
Color darkPurpleColor = const Color(0xff3B17A7);
Color greyColor = const Color(0xff555568);
Color lightGreyColor = const Color(0xff818194);
Color navyColor = const Color(0xff1F244B);

TextStyle labelTextStyle = GoogleFonts.poppins(
  color: greyColor,
  fontWeight: medium,
  fontSize: 16
);

TextStyle hintTextStyle = GoogleFonts.poppins(
    color: lightGreyColor,
    fontWeight: regular,
    fontSize: 14
);

TextStyle buttonTextStyle = GoogleFonts.poppins(
  color: Colors.white,
  fontWeight: medium,
  fontSize: 16
);

TextStyle titleTextStyle = GoogleFonts.poppins(
  color: Colors.white,
  fontWeight: semiBold,
  fontSize: 20
);

TextStyle nameTextStyle = GoogleFonts.poppins(
  color: navyColor,
  fontSize: 18
);

FontWeight bold = FontWeight.w700;
FontWeight semiBold = FontWeight.w600;
FontWeight medium = FontWeight.w500;
FontWeight regular = FontWeight.w400;