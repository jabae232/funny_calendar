import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funny_calendar/core/constants/app_colors.dart';
import 'package:funny_calendar/core/constants/app_styles.dart';
import 'package:funny_calendar/features/calendar_screen/presentation/ui/calendar_screen.dart';
import 'package:funny_calendar/features/diary_screen/data/models/save_file.dart';
import 'package:funny_calendar/features/diary_screen/presentation/state/diary_bloc.dart';
import 'package:funny_calendar/features/diary_screen/presentation/ui/components/diary_sections_text_widget.dart';
import 'package:funny_calendar/features/diary_screen/presentation/ui/components/feelings_selector_list_widget.dart';
import 'package:funny_calendar/features/diary_screen/presentation/ui/components/flush_bar.dart';
import 'package:funny_calendar/features/diary_screen/presentation/ui/components/notes_widget.dart';
import 'package:funny_calendar/features/diary_screen/presentation/ui/components/save_btn_widget.dart';
import 'package:funny_calendar/features/diary_screen/presentation/ui/components/show_success_dialog.dart';
import 'package:funny_calendar/features/diary_screen/presentation/ui/components/slider/slider_widget.dart';
import 'package:funny_calendar/features/diary_screen/presentation/ui/components/subfeelings_selector_widget.dart';
import 'package:funny_calendar/features/diary_screen/presentation/ui/components/tab_switch_widget.dart';
import 'package:funny_calendar/features/diary_screen/presentation/view_model/view_model.dart';
import 'package:provider/provider.dart';

class DiaryScreen extends StatelessWidget {
  const DiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        surfaceTintColor: AppColors.background,
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          '1 января 19:00',
          style: AppStyles.s18w700.copyWith(color: AppColors.gray),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const CalendarScreen(),
                  ),
                );
              },
              child: SvgPicture.asset('assets/icons/svg/calendar.svg'),
            ),
          )
        ],
      ),
      body: BlocListener<DiaryBloc, DiaryState>(
        listener: (context, state) {
          if (state is DiaryErrorState) {
            showFlushBar(
              context: context,
              message: 'Что то пошло не так',
            );
          }
          if (state is DiarySuccessSavedState) {
            showSuccessDialog(context: context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Consumer<DiaryViewModel>(
            builder: (context, diaryVM, _) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TabSwitchWidget(),
                    const SizedBox(height: 30),
                    const DiarySectionsTextWidget(text: 'Что чувствуешь?'),
                    const SizedBox(height: 20),
                    const FeelingsSelectorListWidget(),
                    if (diaryVM.currentFeeling.isNotEmpty)
                      SubFeelingsSelectorWidget(
                        currentSubFeeling: diaryVM.currentSubFeeling,
                        subFeelings: diaryVM.getSubFeelings(),
                        onTap: (String subFeeling) {
                          diaryVM.currentSubFeeling = subFeeling;
                        },
                      ),
                    const SizedBox(height: 36),
                    const DiarySectionsTextWidget(text: 'Уровень стресса'),
                    const SliderWidget(isConfidence: false),
                    const DiarySectionsTextWidget(text: 'Самооценка'),
                    const SliderWidget(isConfidence: true),
                    const DiarySectionsTextWidget(text: 'Заметки'),
                    const SizedBox(height: 20),
                    NotesWidget(
                      notesController: diaryVM.notesController,
                      onChanged: (str) {
                        diaryVM.isButtonPressable();
                      },
                    ),
                    const SizedBox(height: 16),
                    SaveBtnWidget(
                      isBtnActive: diaryVM.isPressable,
                      onPressed: () {
                        context.read<DiaryBloc>().add(
                              SaveCalendarEvent(
                                save: Datum(
                                  feelingName: diaryVM.currentFeeling,
                                  subFeelingName: diaryVM.currentSubFeeling,
                                  notes: diaryVM.notesController.text,
                                  levelOfStress: diaryVM.levelOfStress,
                                  levelOfConfidence: diaryVM.confidenceLevel,
                                  createdDateTime: DateTime.now(),
                                ),
                              ),
                            );
                      },
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
