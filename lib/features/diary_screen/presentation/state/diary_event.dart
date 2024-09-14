part of 'diary_bloc.dart';

sealed class DiaryEvent {}

class GetSavesListEvent extends DiaryEvent{}

class SaveCalendarEvent extends DiaryEvent{
  final Datum save;
  SaveCalendarEvent({required this.save});
}
