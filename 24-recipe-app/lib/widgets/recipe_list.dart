import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/services/recipe_api.dart';
import 'package:recipe_app/models/recipe.dart';

class RecipeList extends StatelessWidget {
  final String categoryId;
  const RecipeList(this.categoryId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Recipe>>(
        future: RecipeApi().findRecipesByCategory(categoryId),
        builder: (BuildContext context, AsyncSnapshot<List<Recipe>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading recipes");
          } else if (snapshot.hasError) {
            return const Text("Error retrieving recipes");
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text("No recipes available");
          } else {
            return Column(children: [
              Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 10),
                  child:
                      const Text('Click a recipe to view its full contents.')),
              ...snapshot.data!.map((recipe) => Container(
                  margin: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    child: Text(recipe.name),
                    onPressed: () => context.go('/recipe/${recipe.id}'),
                  )))
            ]);
          }
        });
  }
}
