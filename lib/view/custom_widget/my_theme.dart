import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class MyTheme{
  static Color loginButtonColor = Colors.purple;
  static Color signupButtonColor = Colors.grey.shade400;
  static Color loginPagBoxColor = const Color(0xffccccff);
  static Color whiteColor = const Color(0xffffffff);
  static double defaultPadding = 20.0;
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    canvasColor:Colors.white,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.white,
    colorScheme: ColorScheme(
        primary: Colors.black,
        primaryVariant: Colors.black54,
        secondary: Colors.black87,
        secondaryVariant: Colors.black87,
        surface: Colors.cyan.shade50,
        background: Colors.cyan.shade100,
        error: Colors.red,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onSurface: Colors.black,
        onBackground: Colors.black,
        onError: Colors.red,
        brightness: Brightness.light),
  );

  static ThemeData DarkTheme(BuildContext context) => ThemeData(
    canvasColor: Colors.black,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.black,
      colorScheme: ColorScheme(
        primary: Colors.white,
        primaryVariant: Colors.white30,
        secondary: Colors.black,
        secondaryVariant: Colors.white,
        surface: Colors.cyan.shade50,
        background: Colors.cyan.shade100,
        error: Colors.red,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onSurface: Colors.black,
        onBackground: Colors.black,
        onError: Colors.red,
        brightness: Brightness.dark),
  );
}