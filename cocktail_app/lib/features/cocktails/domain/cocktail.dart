class Cocktail {
  final String id;
  final String name;
  final String category;
  final String instructions;
  final String image;

  Cocktail({
    required this.id,
    required this.name,
    required this.category,
    required this.instructions,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'instructions': instructions,
      'image': image,
    };
  }

  factory Cocktail.fromMap(Map<String, dynamic> map) {
    return Cocktail(
      id: map['id'],
      name: map['name'],
      category: map['category'],
      instructions: map['instructions'],
      image: map['image'],
    );
  }
}
