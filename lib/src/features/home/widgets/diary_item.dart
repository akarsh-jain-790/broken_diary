import 'package:flutter/material.dart';

import 'package:broken_notes/src/utils/colors_sys.dart';

// ignore: must_be_immutable
class DiaryItem extends StatelessWidget {
  String description;
  String date;
  double height;

  DiaryItem({
    super.key,
    required this.description,
    required this.date,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // MovieCredits movieCredits = await fetchMovieCredits(movie.id);

        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => MovieDetails(
        //             movie: movie,
        //             generes: generes,
        //             movieCredits: movieCredits)));
      },
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: ColorSys.kgrey,
        child: SizedBox(
          // width: 154.0,
          // height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  description,
                  maxLines: 10,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 16.0,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
