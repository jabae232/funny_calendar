import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_calendar/features/application/preference_utils.dart';
import 'package:funny_calendar/features/diary_screen/data/diary_repo.dart';
import 'package:funny_calendar/features/diary_screen/presentation/state/diary_bloc.dart';
import 'package:funny_calendar/features/diary_screen/presentation/ui/diary_screen.dart';
import 'package:funny_calendar/features/diary_screen/presentation/view_model/view_model.dart';
import 'package:provider/provider.dart';

class CalendarFeature extends StatelessWidget {
  const CalendarFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => DiaryRepo(sharedPref: SharedPrefs.instance),
      child: BlocProvider(
        create: (context) => DiaryBloc(repo: context.read<DiaryRepo>()),
        child: ChangeNotifierProvider(
          create: (context) => DiaryViewModel(),
          child: const DiaryScreen(),
        ),
      ),
    );
  }
}
