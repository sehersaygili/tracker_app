import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData getAppTheme() {
    return ThemeData(
      scaffoldBackgroundColor: const Color.fromARGB(255, 248, 231, 220),
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w300,
          color: Colors.white,
          shadows: [
            Shadow(
              color: const Color.fromARGB(255, 28, 26, 26).withOpacity(1),
              offset: const Offset(2, 2),
              blurRadius: 2,
            ),
          ],
        ),
      ),
    );
  }
}
