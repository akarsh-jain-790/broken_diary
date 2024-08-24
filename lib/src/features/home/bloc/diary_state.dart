part of 'diary_bloc.dart';

sealed class DiaryState {}

final class AddDiaryInitial extends DiaryState {}

final class AddDiaryLoading extends DiaryState {}

final class AddDiarySuccess extends DiaryState {}

final class AddDiaryFailure extends DiaryState {
  String error;
  AddDiaryFailure(this.error);
}

final class FetchDiariesInitial extends DiaryState {}

final class FetchDiariesLoading extends DiaryState {}

final class FetchDiariesSuccess extends DiaryState {
  List<Diary> diaries;
  FetchDiariesSuccess(this.diaries);
}

final class FetchDiariesFailure extends DiaryState {
  final String error;

  FetchDiariesFailure(this.error);
}
