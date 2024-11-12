import 'package:cocktail_app/features/cocktails/domain/cocktail.dart';
import 'package:flutter/material.dart';

class CocktailListItem extends StatelessWidget {
  const CocktailListItem({super.key, required this.item});
  final Cocktail item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Hero(
                tag: item.id,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    item.image,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  right: 10,
                  top: 10,
                  child: SizedBox(
                    width: 120,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black54),
                        child: Center(
                            child: Text(
                          item.category,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ))),
                  ))
            ],
          ),
          Text(
            item.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          )
        ],
      ),
    );
  }
}
