import 'package:flutter/material.dart';
import 'package:funny_calendar/core/constants/app_colors.dart';
import 'package:funny_calendar/core/constants/app_styles.dart';

class NotesWidget extends StatelessWidget {
  const NotesWidget({
    super.key,
    required this.notesController,
    required this.onChanged,
  });
  final TextEditingController notesController;
  final Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 90,
      ),
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
        padding: const EdgeInsets.all(10.0),
        child: TextField(
          controller: notesController,
          onChanged: onChanged,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Введите заметку',
            hintStyle: AppStyles.s14w400.copyWith(color: AppColors.gray),
          ),
          maxLines: 5,
          style: AppStyles.s14w400.copyWith(color: AppColors.black),
          cursorColor: AppColors.black,
        ),
      ),
    );
  }
}
