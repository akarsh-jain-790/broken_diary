import 'dart:math';

import 'package:broken_notes/src/features/home/add_diary.dart';
import 'package:broken_notes/src/features/home/bloc/diary_bloc.dart';
import 'package:broken_notes/src/features/home/widgets/diary_item.dart';
import 'package:broken_notes/src/model/diary.dart';
import 'package:broken_notes/src/utils/colors_sys.dart';
import 'package:broken_notes/src/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final rnd = Random();
  late List<int> extents;
  int crossAxisCount = 2;

  @override
  void initState() {
    super.initState();
    context.read<DiaryBloc>().add(FetchDiaries());
    extents = List<int>.generate(100, (int index) => rnd.nextInt(5) + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddDiaryPage()));
        },
        child: Image.asset(
          "assets/icons/crash_icon.png",
          height: 40,
        ),
        backgroundColor: ColorSys.kwhite,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              elevation: 0.0,
              leading: Padding(
                padding: const EdgeInsets.fromLTRB(
                  12.0,
                  0,
                  0,
                  0,
                ),
                child: Text(
                  Strings.appName,
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 32.0),
                ),
              ),
              leadingWidth: double.infinity,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                BlocConsumer<DiaryBloc, DiaryState>(
                  listener: (context, state) {
                    // TODO:
                  },
                  builder: (context, state) {
                    if (state is FetchDiariesLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is FetchDiariesSuccess) {
                      final successState = state as FetchDiariesSuccess;
                      List<Diary> diaries = successState.diaries as List<Diary>;
                      return SingleChildScrollView(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: MasonryGridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 2,
                          crossAxisSpacing: 2,
                          itemCount: diaries.length,
                          itemBuilder: (context, index) {
                            final height =
                                diaries[index].description.length * 10;
                            return DiaryItem(
                              description: diaries[index].description,
                              date: diaries[index].date,
                              height: height.toDouble(),
                            );
                          },
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
