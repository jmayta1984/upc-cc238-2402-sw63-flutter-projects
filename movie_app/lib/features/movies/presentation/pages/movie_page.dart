import 'package:flutter/material.dart';
import 'package:movie_app/core/section_enum.dart';
import 'package:movie_app/features/movies/presentation/widgets/movie_section.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(SectionEnum.values.length,
              (index) => MovieSection(section: SectionEnum.values[index]))),
    );
  }
}
