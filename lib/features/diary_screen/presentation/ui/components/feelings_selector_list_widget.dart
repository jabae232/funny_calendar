import 'package:flutter/material.dart';
import 'package:funny_calendar/features/diary_screen/presentation/ui/components/feelings_selector_widget.dart';
import 'package:funny_calendar/features/diary_screen/presentation/view_model/view_model.dart';
import 'package:provider/provider.dart';

class FeelingsSelectorListWidget extends StatelessWidget {
  const FeelingsSelectorListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DiaryViewModel>(builder: (context, calendarVM, _) {
      return SizedBox(
        height: 120,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: GestureDetector(
                onTap: () {
                  calendarVM.currentFeeling = calendarVM.feelings[index].name;
                },
                child: FeelingsSelectorWidget(
                  isFeelingSelected: calendarVM.currentFeeling ==
                      calendarVM.feelings[index].name,
                  feelingPicture: calendarVM.feelings[index].image,
                  feelingTitle: calendarVM.feelings[index].name,
                ),
              ),
            );
          },
          itemCount: calendarVM.feelings.length,
          scrollDirection: Axis.horizontal,
        ),
      );
    });
  }
}
