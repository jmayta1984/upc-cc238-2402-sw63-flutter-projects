import 'package:flutter/material.dart';
import 'package:movie_app/core/section_enum.dart';
import 'package:movie_app/features/movies/presentation/widgets/movie_list.dart';

class MovieSection extends StatelessWidget {
  const MovieSection({super.key, required this.section});
  final SectionEnum section;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              section.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 300,
            child: MovieList(endpoint: section.endpoint),
          ),
        ],
      ),
    );
  }
}
