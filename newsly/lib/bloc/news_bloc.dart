import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsly/bloc/news_event.dart';
import 'package:newsly/bloc/news_state.dart';
import 'package:newsly/data/remote/news_service.dart';
import 'package:newsly/domain/news.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(SearchNewsInitial()) {
    on<SearchNews>(
      (event, emit) async {
        emit(SearchNewsLoading());
        try {
          List<News> news = await NewsService().searchNews(event.query);
          emit(SearchNewsLoaded(news: news));
        } catch (e) {
          emit(SearchNewsError(message: e.toString()));
        }
      },
    );
  }
}
