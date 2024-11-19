import 'package:cocktail_app/features/cocktails/data/local/cocktail_dao.dart';
import 'package:cocktail_app/features/cocktails/domain/cocktail.dart';
import 'package:flutter/material.dart';

class CocktailDetailPage extends StatefulWidget {
  const CocktailDetailPage({super.key, required this.item});
  final Cocktail item;

  @override
  State<CocktailDetailPage> createState() => _CocktailDetailPageState();
}

class _CocktailDetailPageState extends State<CocktailDetailPage> {
  bool _isFavorite = false;

  Future<void> _loadData() async {
    bool favorite = await CocktailDao().isFavorite(widget.item.id);
    setState(() {
      _isFavorite = favorite;
    });
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: true,
                pinned: true,
                expandedHeight: 400,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.black54, shape: BoxShape.circle),
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                _isFavorite = !_isFavorite;
                              });
                              _isFavorite
                                  ? CocktailDao().insert(widget.item)
                                  : CocktailDao().delete(widget.item.id);
                            },
                            icon: Icon(_isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border))),
                  )
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    tag: widget.item.id,
                    child: Image.network(
                        width: double.infinity,
                        height: 400,
                        fit: BoxFit.cover,
                        widget.item.image),
                  ),
                ),
              )
            ];
          },
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    widget.item.instructions,
                    style: const TextStyle(color: Colors.white70),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
