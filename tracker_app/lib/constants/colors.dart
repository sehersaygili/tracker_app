import 'package:flutter/material.dart';

class AppColors {
  static const kPrimaryColor = Color.fromARGB(255, 248, 131, 48);
  static const kPrimaryLight = Color.fromARGB(255, 248, 231, 220);
  static const kPrimaryShadow = Colors.black;
  static const Color kShadowColor = kPrimaryLight;
  static const kBoxColor = Color.fromARGB(255, 255, 255, 255);
  static const kBoxColor2 = Color.fromARGB(255, 238, 196, 167);

  static List<Shadow> get kTextShadow => [
        Shadow(
          color: kShadowColor.withOpacity(.69),
          offset: const Offset(2, 2),
          blurRadius: 2,
        ),
      ];
}

class AppConstants {
  static const double kAppBarHeight = 150.0;

//Kitap başlığı text
  static const TextStyle cardTitleTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 9,
    shadows: [
      Shadow(color: AppColors.kPrimaryShadow),
    ],
  );
//Kitap altbaşlığı text
  static const TextStyle appBarTextStyle = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    shadows: [
      Shadow(color: AppColors.kShadowColor),
    ],
  );
}
