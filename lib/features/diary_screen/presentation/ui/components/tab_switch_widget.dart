import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funny_calendar/core/constants/app_colors.dart';
import 'package:funny_calendar/core/constants/app_styles.dart';
import 'package:toggle_switch/toggle_switch.dart';

class TabSwitchWidget extends StatelessWidget {
  const TabSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ToggleSwitch(
        initialLabelIndex: 0,
        minWidth: 300,
        minHeight: 30,
        totalSwitches: 2,
        activeBgColor: const [
          AppColors.mandarin,
        ],
        activeFgColor: AppColors.white,
        inactiveFgColor: AppColors.gray,
        animate: true,
        animationDuration: 200,
        curve: Curves.easeInCubic,
        radiusStyle: true,
        inactiveBgColor: AppColors.toggleInactive,
        cornerRadius: 47,
        customWidgets: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/icons/svg/diary.svg'),
              const SizedBox(width: 5),
              Text(
                'Дневник настроения',
                style: AppStyles.s12w500
                    .copyWith(color: AppColors.white),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset('assets/icons/svg/statistics.svg'),
              const SizedBox(width: 5),
              Text(
                'Статистика',
                style: AppStyles.s12w500
                    .copyWith(color: AppColors.white),
              ),
            ],
          ),
        ],
        onToggle: (index) {},
      ),
    );
  }
}
