import 'package:newsly/domain/news.dart';

abstract class NewsState {}

class SearchNewsInitial extends NewsState {}

class SearchNewsLoading extends NewsState {}

class SearchNewsLoaded extends NewsState {
  final List<News> news;

   SearchNewsLoaded({required this.news});
}

class SearchNewsError extends NewsState {
  final String message;
  SearchNewsError({required this.message});
}
