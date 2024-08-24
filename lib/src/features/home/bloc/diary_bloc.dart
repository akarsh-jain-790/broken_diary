import 'package:broken_notes/src/model/diary.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'diary_event.dart';
part 'diary_state.dart';

class DiaryBloc extends Bloc<DiaryEvent, DiaryState> {
  DiaryBloc() : super(AddDiaryInitial()) {
    on<AddDiary>((event, emit) => addDiary(event, emit));
    on<FetchDiaries>((event, emit) => fetchDiaries(event, emit));
  }

  void addDiary(AddDiary event, Emitter<DiaryState> emit) {
    try {
      emit(AddDiaryLoading());
      FirebaseFirestore db = FirebaseFirestore.instance;

      Diary group = Diary(description: event.description, date: event.date);

      db.collection("Diaries").doc().set(group.toMap());

      emit(AddDiarySuccess());
    } catch (e) {
      emit(AddDiaryFailure("Failed to post Diary!"));
    }
  }

  void fetchDiaries(FetchDiaries event, Emitter<DiaryState> emit) async {
    try {
      emit(FetchDiariesLoading());

      FirebaseFirestore db = FirebaseFirestore.instance;

      List<Diary> list = [];
      await db.collection("Diaries").get().then(
        (querySnapshot) {
          for (var docSnapshot in querySnapshot.docs) {
            final data = docSnapshot.data() as Map<String, dynamic>;

            Diary diary = Diary(
              date: data["date"],
              description: data["description"],
            );

            list.add(diary);
          }
        },
        onError: (e) => emit(FetchDiariesFailure("Failed to load data!")),
      );
      emit(FetchDiariesSuccess(list));
    } on Exception catch (_) {
      emit(FetchDiariesFailure("Failed to Fetch Data!"));
    }
  }
}
