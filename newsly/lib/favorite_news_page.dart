import 'package:flutter/material.dart';
import 'package:newsly/favorite_news_item.dart';
import 'package:newsly/news.dart';
import 'package:newsly/utils.dart';

class FavoriteNewsPage extends StatefulWidget {
  const FavoriteNewsPage({super.key});

  @override
  State<FavoriteNewsPage> createState() => _FavoriteNewsPageState();
}

class _FavoriteNewsPageState extends State<FavoriteNewsPage> {
  List<News> _news = [];

  void loadData() async {
    List maps = await Utils().loadJsonFromAssets('assets/articles.json');
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
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)))),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _news.length,
            itemBuilder: (context, index) {
              return FavoriteNewsItem(
                news: _news[index],
                onDeleteNews: (news) {
                  setState(() {
                    _news.remove(news);
                  });
                },
              );
            },
          ),
        )
      ],
    );
  }
}
