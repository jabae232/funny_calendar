import 'package:flutter/material.dart';
import 'package:funny_calendar/core/constants/app_colors.dart';
import 'package:funny_calendar/core/constants/app_styles.dart';

class DiarySectionsTextWidget extends StatelessWidget {
  const DiarySectionsTextWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppStyles.s16w800.copyWith(color: AppColors.black),
    );
  }
}
