import 'package:flutter/material.dart';
import 'package:funny_calendar/features/diary_screen/feature.dart';
import 'features/application/preference_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.init();
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: CalendarFeature(),
    ),
  );
}
