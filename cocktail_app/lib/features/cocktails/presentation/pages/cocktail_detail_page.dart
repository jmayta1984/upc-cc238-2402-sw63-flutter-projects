import 'package:cocktail_app/features/cocktails/domain/cocktail.dart';
import 'package:flutter/material.dart';

class CocktailDetailPage extends StatelessWidget {
  const CocktailDetailPage({super.key, required this.item});
  final Cocktail item;

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
                            onPressed: () {},
                            icon: const Icon(Icons.favorite_border))),
                  )
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    tag: item.id,
                    child: Image.network(
                        width: double.infinity,
                        height: 400,
                        fit: BoxFit.cover,
                        item.image),
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
                    item.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    item.instructions,
                    style: const TextStyle(
                        color: Colors.white70),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
