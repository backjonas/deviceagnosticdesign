import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/models/recipe.dart';

class RecipeCardWidget extends StatelessWidget {
  final Recipe recipe;
  const RecipeCardWidget(this.recipe);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(20),
        child: InkWell(
            onTap: () => context.go('/recipe/${recipe.id}'),
            child: ListTile(
              leading: Container(
                  margin: EdgeInsets.all(10),
                  width: 100,
                  child: const Placeholder()),
              title: Text(recipe.name),
            )));
  }
}
