import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/widgets/recipe_list.dart';
import 'package:recipe_app/layout/breakpoints.dart';

class ExpandedCategoryWidget extends StatelessWidget {
  final List<Recipe> recipes;
  const ExpandedCategoryWidget(this.recipes);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (size.width > Breakpoints.lg) {
      return RecipeListWidget(recipes);
    } else {
      return Column(
        children: recipes.map((recipe) => Text(recipe.name)).toList(),
      );
    }
  }
}
