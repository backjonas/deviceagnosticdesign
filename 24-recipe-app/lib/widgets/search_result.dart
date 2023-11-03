import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';
import 'package:recipe_app/services/recipe_api.dart';
import 'package:recipe_app/widgets/recipe_list.dart';

class SearchResultWidget extends StatelessWidget {
  final String query;
  const SearchResultWidget(this.query);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Recipe>>(
        future: RecipeApi().findRecipesByName(query),
        builder: (BuildContext context, AsyncSnapshot<List<Recipe>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading recipes");
          } else if (snapshot.hasError) {
            return const Text("Error retrieving recipes");
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text("No recipies found with name: $query");
          } else {
            return Column(children: [
              Container(
                margin: const EdgeInsets.all(5),
                child: Text(
                  style: TextStyle(fontSize: 36),
                  "Recipes with the name $query:",
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 10),
                  child:
                      const Text('Click a recipe to view its full contents.')),
              RecipeListWidget(snapshot.data!)
            ]);
          }
        });
  }
}
