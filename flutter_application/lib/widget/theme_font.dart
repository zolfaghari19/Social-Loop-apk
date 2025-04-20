import 'package:flutter/material.dart';
import 'package:flutter_application/gen/fonts.gen.dart';

class MyAppThemeFont {

  static ThemeData get theme {
    const primaryTextColor = Color(0xff0D253C);
    const secondaryTextColor = Color.fromARGB(255, 83, 88, 100);
    const primaryColor = Color(0xff376AED);
    
    return ThemeData(
      primaryColor: primaryColor,
      textTheme: TextTheme(
        titleMedium: TextStyle(
          fontFamily: FontFamily.avenir,
          fontWeight: FontWeight.w400,
          color: secondaryTextColor,
          fontSize: 18,
        ),
        titleLarge: TextStyle(
          fontFamily: FontFamily.avenir,
          fontWeight: FontWeight.w700,
          color: primaryTextColor,
          fontSize: 20,
        ),
        bodyMedium: TextStyle(
          fontFamily: FontFamily.avenir,
          color: secondaryTextColor,
          fontSize: 15,
        ),
        headlineLarge: TextStyle(
          fontFamily: FontFamily.avenir,
          fontWeight: FontWeight.w500,
          color: primaryTextColor,
          fontSize: 24,
        ),
        headlineMedium: TextStyle(
          fontFamily: FontFamily.avenir,
          fontSize: 20,
          color: Colors.blue,
          fontWeight: FontWeight.w700,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStateProperty.all(
            const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: FontFamily.avenir,
            ),
          ),
        ),
      ),
    );
  }
}
