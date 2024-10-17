import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsly/bloc/news_bloc.dart';
import 'package:newsly/bloc/news_event.dart';
import 'package:newsly/bloc/news_state.dart';
import 'package:newsly/presentation/news_details/news_details_screen.dart';

class SearchNewsPage extends StatefulWidget {
  const SearchNewsPage({super.key});

  @override
  State<SearchNewsPage> createState() => _SearchNewsPageState();
}

class _SearchNewsPageState extends State<SearchNewsPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4.0, right: 4.0),
          child: TextField(
            onSubmitted: (value) {
              context.read<NewsBloc>().add(SearchNews(query: value));
            },
            controller: _controller,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search), border: OutlineInputBorder()),
          ),
        ),
        BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is SearchNewsLoading) {
              return const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is SearchNewsLoaded) {
              return Expanded(
                child: ListView.builder(
                  itemCount: state.news.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewsDetailsScreen(
                                    news: state.news[index])));
                      },
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Hero(
                              tag: state.news[index].title,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  state.news[index].urlToImage,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const SizedBox(
                                      height: 150,
                                      child: Center(
                                          child: Text("No image found.")),
                                    );
                                  },
                                  height: 150,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              state.news[index].title,
                              maxLines: 1,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(state.news[index].author),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 4.0, right: 4.0, bottom: 8),
                              child: Text(
                                state.news[index].description,
                                maxLines: 3,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            return const Expanded(child: Center());
          },
        )
      ],
    );
  }
}
