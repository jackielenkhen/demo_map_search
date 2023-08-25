import 'package:demo_map_search/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      labelLarge: lableTextStyle,
      labelMedium: lableTextStyle,
      labelSmall: lableTextStyle,
      bodyMedium: TextStyle(color: secondaryColor40LightTheme),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      toolbarTextStyle: TextStyle(color: textColorLightTheme),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: defaultPadding),
      fillColor: secondaryColor10LightTheme,
      filled: true,
      border: lightThemeOutlineInputBorder,
      enabledBorder: lightThemeOutlineInputBorder,
      focusedBorder: lightThemeOutlineInputBorder,
      disabledBorder: lightThemeOutlineInputBorder,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: const Size(double.infinity, 48),
        shape: const StadiumBorder(),
        backgroundColor: primaryColor,
        textStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
