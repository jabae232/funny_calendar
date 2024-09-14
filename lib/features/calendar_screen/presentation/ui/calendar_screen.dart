import 'package:flutter/material.dart';
import 'package:funny_calendar/core/constants/app_colors.dart';
import 'package:funny_calendar/core/constants/app_styles.dart';
import 'package:funny_calendar/features/calendar_screen/presentation/ui/components/month_widget.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});
  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late final int currentYear;
  @override
  void initState() {
    currentYear = DateTime.now().year;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final listWeekDays = ['пн', 'вт', 'ср', 'чт', 'пт', 'сб', 'вс'];
    final listMonthNames = [
      'Январь',
      'Февраль',
      'Март',
      'Апрель',
      'Май',
      'Июнь',
      'Июль',
      'Август',
      'Сентябрь',
      'Октябрь',
      'Ноябрь',
      'Декабрь'
    ];
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        elevation: 0,
        surfaceTintColor: AppColors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close,
                  color: AppColors.gray,
                  size: 24,
                ),
              ),
              Text(
                'Сегодня',
                style: AppStyles.s18w700.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.gray,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(
                    7,
                    (index) => Text(
                      listWeekDays[index],
                      style: AppStyles.s12w500.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.gray,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 12),
              ...List.generate(12, (index) {
                return MonthWidget(
                  currentYear: currentYear,
                  monthIndex: index + 1,
                  monthName: listMonthNames[index],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
