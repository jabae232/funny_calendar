import 'package:flutter/material.dart';
import 'package:funny_calendar/core/constants/app_colors.dart';
import 'package:funny_calendar/core/constants/app_styles.dart';

class FeelingsSelectorWidget extends StatelessWidget {
  const FeelingsSelectorWidget({
    required this.feelingPicture,
    required this.feelingTitle,
    required this.isFeelingSelected,
    super.key,
  });
  final String feelingTitle;
  final String feelingPicture;
  final bool isFeelingSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 83,
      ),
      decoration: BoxDecoration(
        border: isFeelingSelected ? Border.all(color: AppColors.mandarin,width: 2) : null,
        borderRadius: BorderRadius.circular(76),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withOpacity(0.11),
            spreadRadius: 0,
            blurRadius: 10.8,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 18, 8, 25),
        child: Column(
          children: [
            Image.asset(
              feelingPicture,
              width: 53,
              height: 50,
            ),
            Text(
              feelingTitle,
              style: AppStyles.s11w400.copyWith(color: AppColors.black),
            ),
          ],
        ),
      ),
    );
  }
}
