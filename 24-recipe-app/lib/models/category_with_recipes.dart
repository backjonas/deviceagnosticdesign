import './recipe.dart';
import './category.dart';

class CategoryWithRecipes {
  final String id;
  final String name;
  final String picture;
  final List<Recipe> recipes;

  CategoryWithRecipes({
    required this.id,
    required this.name,
    required this.picture,
    required this.recipes,
  });

  factory CategoryWithRecipes.fromCategoryAndRecipes(
      Category category, List<Recipe> recipes) {
    return CategoryWithRecipes(
      id: category.id,
      name: category.name,
      picture: category.picture,
      recipes: recipes,
    );
  }
}
