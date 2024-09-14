import 'package:flutter/material.dart';
import 'package:funny_calendar/core/constants/app_colors.dart';
import 'package:funny_calendar/core/constants/app_styles.dart';

class SubFeelingsSelectorWidget extends StatelessWidget {
  const SubFeelingsSelectorWidget({
    super.key,
    required this.subFeelings,
    required this.onTap,
    required this.currentSubFeeling,
  });
  final List<String> subFeelings;
  final Function(String) onTap;
  final String currentSubFeeling;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Wrap(
        children: [
          ...List.generate(
            subFeelings.length,
            (index) {
              bool isSubFeelingSelected =
                  currentSubFeeling == subFeelings[index];
              return Padding(
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () {
                    onTap.call(subFeelings[index]);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSubFeelingSelected
                          ? AppColors.mandarin
                          : AppColors.white,
                      borderRadius: BorderRadius.circular(3),
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
                        vertical: 3.0,
                      ),
                      child: Text(
                        subFeelings[index],
                        style: AppStyles.s11w400.copyWith(
                          color: isSubFeelingSelected
                              ? AppColors.white
                              : AppColors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
