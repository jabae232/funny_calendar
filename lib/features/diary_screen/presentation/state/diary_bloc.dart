import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_calendar/features/diary_screen/data/diary_repo.dart';
import 'package:funny_calendar/features/diary_screen/data/models/save_file.dart';

part 'diary_event.dart';
part 'diary_state.dart';

class DiaryBloc extends Bloc<DiaryEvent, DiaryState> {
  final DiaryRepo repo;
  DiaryBloc({required this.repo}) : super(DiaryInitial()) {
    on<GetSavesListEvent>((event, emit) {
      final saveFiles = repo.getSaves();
      emit(DiaryLoadedState(saveFile: saveFiles));
    });
    on<SaveCalendarEvent>((event, emit) {
      try{
        repo.setSaves(event.save);
        emit(DiarySuccessSavedState());
      } catch (e) {
        emit(DiaryErrorState());
      }
    });
  }
}
