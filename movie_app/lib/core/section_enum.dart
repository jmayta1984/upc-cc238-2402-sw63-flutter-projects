import 'package:movie_app/core/app_constants.dart';

enum SectionEnum {
  nowPlaying(title: 'Now playing', endpoint: AppConstants.movieNowPlayingEndpoint),
  topRated (title: 'Top rated', endpoint: AppConstants.movieTopRatedEndpoint),
  popular(title: 'Popular', endpoint: AppConstants.moviePopularEndpoint),
  upcoming(title: 'Upcoming', endpoint: AppConstants.movieUpComingEndpoint);

  const SectionEnum({required this.title, required this.endpoint});
  final String title;
  final String endpoint;
}