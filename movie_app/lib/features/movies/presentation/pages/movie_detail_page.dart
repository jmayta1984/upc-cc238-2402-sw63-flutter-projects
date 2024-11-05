import 'package:flutter/material.dart';
import 'package:movie_app/features/movies/domain/movie.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: true,
                pinned: true,
                expandedHeight: 450,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Image.network(
                        movie.posterPath,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                          top: 50,
                          right: 10,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite_border_outlined,
                                color: Colors.yellow.shade800,
                                size: 30,

                              ))),
                      
                    ],
                  ),
                ),
              )
            ];
          },
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.yellow.shade800,
                            size: 40,
                          ),
                          Positioned.fill(
                              child: Center(
                            child: Text(
                              movie.voteAverage.toStringAsFixed(1),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ))
                        ],
                      ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: Text(
                    '${DateTime.parse(movie.releaseDate).year}',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    movie.overview,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
