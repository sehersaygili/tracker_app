import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tracker_app/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            AppBar(),
          ],
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 140, left: 10, right: 20),
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        gradient: LinearGradient(
          colors: [kPrimaryColor, kPrimaryLight],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " Book Tracker'a \n Hoş Geldin!",
                style: TextStyle(
                  fontSize: 20, // Metnin font büyüklüğü
                  color: Colors.white, // Metnin rengi
                  shadows: [
                    Shadow(
                      color: Colors.grey
                          .withOpacity(0.5), // Gölge rengi ve opaklığı
                      offset: Offset(2, 2), // Gölgenin x ve y koordinatları
                      blurRadius: 3, // Gölgenin bulanıklık yarıçapı
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
