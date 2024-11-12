import 'package:cocktail_app/features/cocktails/domain/cocktail.dart';

class CocktailDto {
  final String id;
  final String name;
  final String category;
  final String instructions;
  final String image;

  CocktailDto({
    required this.id,
    required this.name,
    required this.category,
    required this.instructions,
    required this.image,
  });

  factory CocktailDto.fromJson(Map<String, dynamic> json) {
    return CocktailDto(
      id: json['idDrink'] ?? '',
      name: json['strDrink'] ?? '',
      category: json['strCategory'] ?? '',
      instructions: json['strInstructions'] ?? '',
      image: json['strDrinkThumb'] ?? '',
    );
  }

  Cocktail toCockTail() {
    return Cocktail(
        id: id,
        name: name,
        category: category,
        instructions: instructions,
        image: image);
  }
}
