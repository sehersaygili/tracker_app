import 'package:flutter/material.dart';

class AppColors {
  static const kPrimaryColor = Color.fromARGB(255, 255, 106, 0);
  static const kPrimaryLight = Color.fromARGB(255, 252, 177, 124);
  static const Color kShadowColor = Color(0xFF1C1A1A);

  static List<Shadow> get kTextShadow => [
        Shadow(
          color: kShadowColor.withOpacity(1),
          offset: const Offset(2, 2),
          blurRadius: 2,
        ),
      ];
}

class AppConstants {
  static const double kAppBarHeight = 150.0;
}
