import 'package:flutter/material.dart';
import 'package:funny_calendar/core/constants/app_colors.dart';
import 'package:funny_calendar/core/constants/app_styles.dart';
import 'package:quiver/time.dart' as quiver;

class MonthWidget extends StatelessWidget {
  const MonthWidget({
    super.key,
    required this.monthIndex,
    required this.monthName,
    required this.currentYear,
  });
  final int monthIndex;
  final int currentYear;
  final String monthName;
  @override
  Widget build(BuildContext context) {
    final daysInMonth = quiver.daysInMonth(currentYear, monthIndex);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          currentYear.toString(),
          style: AppStyles.s16w800.copyWith(
            color: AppColors.gray,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          monthName,
          style: AppStyles.s24w700.copyWith(color: AppColors.black),
        ),
        const SizedBox(height: 17),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
          ),
          itemBuilder: (context, index) {
            return Text((index + 1).toString());
          },
          itemCount: daysInMonth,
        )
      ],
    );
  }
}
