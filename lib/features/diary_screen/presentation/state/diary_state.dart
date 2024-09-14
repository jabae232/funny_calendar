part of 'diary_bloc.dart';

sealed class DiaryState {}

final class DiaryInitial extends DiaryState {}
final class DiaryLoadingState extends DiaryState {}
final class DiaryLoadedState extends DiaryState {
  final SaveFile saveFile;
  DiaryLoadedState({required this.saveFile});
}
final class DiarySuccessSavedState extends DiaryState{}
final class DiaryErrorState extends DiaryState {}
