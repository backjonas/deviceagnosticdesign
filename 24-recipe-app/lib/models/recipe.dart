class Recipe {
  final String id;
  final String name;
  final String picture;
  final List<String> ingredients;
  final List<String> steps;
  final String categoryId;

  Recipe(
      {required this.id,
      required this.name,
      required this.picture,
      required this.ingredients,
      required this.steps,
      required this.categoryId});

  factory Recipe.fromFirestore(Map<String, dynamic> data, String id) {
    return Recipe(
      id: id,
      name: data['name'],
      picture: data['picture'],
      ingredients: List<String>.from(data['ingredients']),
      steps: List<String>.from(data['steps']),
      categoryId: data['category_id'],
    );
  }
}
