import 'package:flutter/material.dart';
import 'package:funny_calendar/core/constants/app_colors.dart';
import 'package:funny_calendar/core/constants/app_styles.dart';
import 'package:funny_calendar/features/diary_screen/presentation/ui/components/slider/custom_track_shape.dart';
import 'package:funny_calendar/features/diary_screen/presentation/view_model/view_model.dart';
import 'package:provider/provider.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key, required this.isConfidence});
  final bool isConfidence;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0,bottom: 36.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(13),
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
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 16,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(6, (index) {
                    return Container(
                      color: AppColors.gray,
                      height: 8,
                      width: 2,
                    );
                  }),
                ],
              ),
              Consumer<DiaryViewModel>(
                builder: (context, calendarVM, _) {
                  return SliderTheme(
                    data: SliderThemeData(
                      activeTrackColor: AppColors.mandarin,
                      inactiveTrackColor: AppColors.gray,
                      overlayColor: AppColors.white,
                      thumbColor: AppColors.mandarin,
                      trackShape: CustomTrackShape(),
                    ),
                    child: Slider(
                      value: isConfidence
                          ? calendarVM.confidenceLevel
                          : calendarVM.levelOfStress,
                      onChanged: (val) {
                        if (isConfidence) {
                          calendarVM.confidenceLevel = val;
                        } else {
                          calendarVM.levelOfStress = val;
                        }
                      },
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isConfidence ? 'Неуверенность' : 'Низкий',
                    style:
                        AppStyles.s11w400.copyWith(color: AppColors.sliderText),
                  ),
                  Text(
                    isConfidence ? 'Уверенность' : 'Высокий',
                    style:
                        AppStyles.s11w400.copyWith(color: AppColors.sliderText),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
