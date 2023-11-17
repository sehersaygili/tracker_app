import 'package:flutter/material.dart';
import 'package:tracker_app/constants/colors.dart';

class StyledTextCard extends StatelessWidget {
  final String text;
  final bool flexible;
  const StyledTextCard({Key? key, required this.text, this.flexible = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textwidget = Text(
      text,
      style: AppConstants.cardTitleTextStyle,
      textAlign: TextAlign.center,
    );
    if (flexible) return Flexible(child: textwidget);
    return textwidget;
  }
}

class StyledTextAppBar extends StatelessWidget {
  final String text;
  final bool flexible;
  const StyledTextAppBar({Key? key, required this.text, this.flexible = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textwidget = Text(
      text,
      style: AppConstants.appBarTextStyle,
      textAlign: TextAlign.center,
    );
    if (flexible) return Flexible(child: textwidget);
    return textwidget;
  }
}
