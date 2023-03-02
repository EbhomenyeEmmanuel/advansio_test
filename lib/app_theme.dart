import 'package:flutter/material.dart';

import 'common/utils/pallete.dart';

class AppTheme {
  AppTheme._();

  static TextTheme lightTextTheme = const TextTheme(
    bodyText1: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontFamily: 'DmSans'),
    bodyText2: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w400,
        color: Colors.black,
        fontFamily: 'DmSans'),
    headline1: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontFamily: 'DmSans'),
    headline2: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontFamily: 'DmSans'),
    headline3: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontFamily: 'DmSans'),
    headline4: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontFamily: 'DmSans'),
    headline6: TextStyle(
        fontSize: 35.0,
        fontWeight: FontWeight.w700,
        color: Colors.black,
        fontFamily: 'DmSans'),
  );

  static ThemeData light() {
    const primaryColor = Palette.primaryColor;
    return ThemeData(
        brightness: Brightness.light,
        primaryColor: primaryColor,
        fontFamily: "DmSans",
        accentColor: Colors.black,
        textSelectionTheme:
            const TextSelectionThemeData(selectionColor: Palette.primaryLightColor),
        textTheme: lightTextTheme,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: const ColorScheme.light(),
        appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black, opacity: 0.8)),
        iconTheme: const IconThemeData(color: Colors.black, opacity: 0.8));
  }

}
