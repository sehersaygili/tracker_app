import 'package:flutter/material.dart';
import 'package:tracker_app/constants/colors.dart';
import 'package:tracker_app/constants/text_styles.dart';
import 'package:tracker_app/constants/themes.dart';
import 'package:tracker_app/models/book.dart';
import 'package:tracker_app/view/home_page.dart';

class DetailPage extends StatelessWidget {
  final Book book;

  const DetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MyAppBar(),
            Text(
              'Başlık: ${book.title}',
              style: AppConstants.appBarTextStyle,
            ),
            Text(
              'Yazar: ${book.author}',
              style: AppConstants.cardTitleTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
