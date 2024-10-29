import 'package:movie_app/core/app_constants.dart';
import 'package:movie_app/features/movies/data/remote/movie_dto.dart';
import 'package:http/http.dart' as http;

class MovieService {
  List<MovieDto> getMovies(String endpoint, int page) async {
    http.Response response = await http.get(Uri.parse(
        '${AppConstants.baseUrl}${AppConstants.movieEndpoint}$endpoint${AppConstants.apiKeyQuery}${AppConstants.pageQuery}$page'));
  
  }
}
