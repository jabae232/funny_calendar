import 'package:flutter/material.dart';
import 'package:funny_calendar/core/constants/app_colors.dart';
import 'package:funny_calendar/core/constants/app_styles.dart';

class SaveBtnWidget extends StatelessWidget {
  const SaveBtnWidget({
    super.key,
    required this.isBtnActive,
    required this.onPressed,
  });
  final bool isBtnActive;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mandarin,
        ),
        onPressed: isBtnActive ? onPressed : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Сохранить',
              style: AppStyles.s20w400.copyWith(
                color: isBtnActive ? AppColors.white : AppColors.gray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
