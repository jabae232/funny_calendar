import 'package:funny_calendar/features/diary_screen/data/models/save_file.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DiaryRepo {
  final SharedPreferences sharedPref;
  DiaryRepo({required this.sharedPref});

  SaveFile getSaves() {
    final response = sharedPref.getString('save') ?? '';
    final saveFile = saveFileFromJson(response);
    return saveFile;
  }

  void setSaves(Datum save) {
    final response = sharedPref.getString('save');
    if (response == null) {
      sharedPref.setString('save', saveFileToJson(SaveFile(data: [save])));
    } else {
      final saveFile = saveFileFromJson(response);
      saveFile.data.add(save);
      sharedPref.setString('save', saveFileToJson(saveFile));
    }
  }
}
