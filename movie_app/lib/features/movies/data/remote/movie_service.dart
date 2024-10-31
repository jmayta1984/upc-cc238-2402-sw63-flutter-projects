import 'dart:convert';
import 'dart:io';

import 'package:movie_app/core/app_constants.dart';
import 'package:movie_app/features/movies/data/remote/movie_dto.dart';
import 'package:http/http.dart' as http;

class MovieService {
  Future<List<MovieDto>> getMovies(String endpoint, int page) async {
    try {
      http.Response response = await http.get(Uri.parse(
          '${AppConstants.baseUrl}${AppConstants.movieEndpoint}$endpoint${AppConstants.apiKeyQuery}${AppConstants.pageQuery}$page'));

      if (response.statusCode == HttpStatus.ok) {
        dynamic jsonResponse = jsonDecode(response.body);
        List results = jsonResponse['results'];

        List<MovieDto> moviesDto =
            results.map((json) => MovieDto.fromJson(json)).toList();
        return moviesDto;
      }
      return [];
    } catch (error) {
      return [];
    }
  }
}
