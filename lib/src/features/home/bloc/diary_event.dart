part of 'diary_bloc.dart';

sealed class DiaryEvent {}

class AddDiary extends DiaryEvent {
  String description;
  String date;
  AddDiary({
    required this.description,
    required this.date,
  });
}

class FetchDiaries extends DiaryEvent {}
