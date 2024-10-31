import 'package:flutter/material.dart';
import 'package:movie_app/features/movies/domain/movie.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Card(
      child: SizedBox(
        width: width / 2,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                movie.posterPath,
                height: height / 3,
              ),
            ),
            Text(movie.title, maxLines: 1, softWrap: false, overflow: TextOverflow.ellipsis,),
          ],
        ),
      ),
    );
  }
}
