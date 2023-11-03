import './recipe.dart';

class Category {
  final String id;
  final String name;
  final String picture;
  final List<Recipe> recipes;

  Category({
    required this.id,
    required this.name,
    required this.picture,
    this.recipes = const [],
  });

  factory Category.fromFirestore(Map<String, dynamic> data, String id) {
    return Category(
      id: id,
      name: data['name'],
      picture: data['picture'],
    );
  }
  factory Category.fromFirestoreWithRecipe(
      Map<String, dynamic> data, String id, List<Recipe> recipes) {
    return Category(
      id: id,
      name: data['name'],
      picture: data['picture'],
      recipes: recipes,
    );
  }
}
