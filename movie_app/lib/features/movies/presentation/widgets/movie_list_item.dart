import 'package:flutter/material.dart';
import 'package:movie_app/features/movies/domain/movie.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 180,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              movie.posterPath,
              height: 240,
            ),
          ),
          Text(
            movie.title,
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                double starValue = movie.voteAverage / 2 - index;
                IconData icon;
    
                if (starValue >= 1) {
                  icon = Icons.star;
                } else if (starValue > 0) {
                  icon = Icons.star_half;
                } else {
                  icon = Icons.star_border;
                }
                return Icon(
                  icon,
                  color: Colors.yellow.shade800,
                );
              }))
        ],
      ),
    );
  }
}
