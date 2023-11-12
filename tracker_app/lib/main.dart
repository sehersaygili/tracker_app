import 'package:flutter/material.dart';
import 'package:tracker_app/constants/themes.dart';
import 'package:tracker_app/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Tracker',
      theme: AppThemes.getAppTheme(),
      home: const HomePage(),
    );
  }
}
