import 'package:flutter/material.dart';
import 'package:funny_calendar/core/constants/app_colors.dart';
import 'package:funny_calendar/core/constants/app_styles.dart';

Future showSuccessDialog({
  required BuildContext context,
}) async {
  return showAdaptiveDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        'Успех!',
        textAlign: TextAlign.center,
        style: AppStyles.s20w400.copyWith(color: AppColors.mandarin),
      ),
    ),
  );
}
