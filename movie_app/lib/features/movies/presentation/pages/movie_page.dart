import 'package:flutter/material.dart';
import 'package:movie_app/core/app_constants.dart';
import 'package:movie_app/features/movies/presentation/widgets/movie_list.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Now playing',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: height * 0.40,
            child:
                const MovieList(endpoint: AppConstants.movieNowPlayingEndpoint),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Popular',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: height * 0.40,
            child: const MovieList(endpoint: AppConstants.moviePopularEndpoint),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Top rated',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: height * 0.40,
            child: const MovieList(endpoint: AppConstants.movieTopRatedEndpoint),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Upcoming',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: height * 0.40,
            child: const MovieList(endpoint: AppConstants.movieUpComingEndpoint),
          ),
        ],
      ),
    );
  }
}
