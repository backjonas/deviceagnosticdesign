import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/models/recipe.dart';

class RecipeListWidget extends StatelessWidget {
  final List<Recipe> recipes;
  const RecipeListWidget(this.recipes);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: recipes
            .map((recipe) => Container(
                margin: const EdgeInsets.all(5),
                child: ElevatedButton(
                  child: Text(recipe.name),
                  onPressed: () => context.go('/recipe/${recipe.id}'),
                )))
            .toList());
  }
}
