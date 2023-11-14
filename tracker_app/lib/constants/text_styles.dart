import 'package:flutter/material.dart';
import 'package:tracker_app/constants/colors.dart';

class StyledTextCard extends StatelessWidget {
  final String text;
  const StyledTextCard({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppConstants.cardTitleTextStyle,
      textAlign: TextAlign.center,
    );
  }
}

class StyledTextAppBar extends StatelessWidget {
  final String text;
  const StyledTextAppBar({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppConstants.appBarTextStyle,
      textAlign: TextAlign.center,
    );
  }
}
