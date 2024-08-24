import 'package:broken_notes/src/common_widgets/alerts.dart';
import 'package:broken_notes/src/features/home/bloc/diary_bloc.dart';
import 'package:broken_notes/src/features/home/home_page.dart';
import 'package:broken_notes/src/utils/colors_sys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddDiaryPage extends StatefulWidget {
  const AddDiaryPage({super.key});

  @override
  State<AddDiaryPage> createState() => _AddDiaryPageState();
}

class _AddDiaryPageState extends State<AddDiaryPage> {
  TextEditingController diaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Write Your Wounds",
            style: Theme.of(context).textTheme.bodyLarge),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: ColorSys.kwhite,
        ),
        actions: [
          IconButton(
            onPressed: () {
              addDiary(context, diaryController);
            },
            icon: const Icon(Icons.send),
            color: ColorSys.kwhite,
          ),
        ],
      ),
      body: BlocConsumer<DiaryBloc, DiaryState>(
        listener: (context, state) {
          if (state is AddDiarySuccess) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          }
        },
        builder: (context, state) {
          return state is AddDiaryLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextField(
                              decoration: InputDecoration(
                                hintText: "Pen Your Pain....",
                                hintStyle: TextStyle(color: ColorSys.kgrey),
                              ),
                              controller: diaryController,
                              scrollPadding: const EdgeInsets.all(20.0),
                              keyboardType: TextInputType.multiline,
                              maxLines: 99999,
                              autofocus: true,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        },
      ),
      resizeToAvoidBottomInset: true,
    );
  }

  void addDiary(BuildContext context, TextEditingController diaryController) {
    if (diaryController.text.isNotEmpty && diaryController.text.length > 30) {
      context.read<DiaryBloc>().add(AddDiary(
            description: diaryController.text.trim(),
            date: DateTime.now().toString(),
          ));
      return;
    }
    showAlert(context, "Diary can't be empty!", "", "error");
  }
}
