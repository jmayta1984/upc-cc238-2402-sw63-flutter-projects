import 'package:flutter/material.dart';
import 'package:newsly/news.dart';
import 'package:newsly/news_item.dart';
import 'package:newsly/utils.dart';

class SearchNewsPage extends StatefulWidget {
  const SearchNewsPage({super.key});

  @override
  State<SearchNewsPage> createState() => _SearchNewsPageState();
}

class _SearchNewsPageState extends State<SearchNewsPage> {
  List<News> _news = [];
  final TextEditingController _controller = TextEditingController();

  void loadData() async {
    List maps = await Utils().loadJsonFromApi(_controller.text);
    setState(() {
      _news = maps.map((json) => News.fromJson(json)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: TextField(
              onSubmitted: (value) {
                loadData();
              },
              controller: _controller,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)))),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _news.length,
            itemBuilder: (context, index) {
              return NewsItem(news: _news[index]);
            },
          ),
        )
      ],
    );
  }
}
