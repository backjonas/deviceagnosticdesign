import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/layout/screen_wrapper.dart';
import 'package:recipe_app/models/category.dart';
import 'package:recipe_app/services/category_api.dart';
import 'package:recipe_app/services/recipe_api.dart';
import 'package:recipe_app/widgets/recipe_card.dart';
import 'package:recipe_app/models/recipe.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      Center(
          child: Column(
        children: [
          Container(
              margin: const EdgeInsets.all(5),
              child: const Text(
                style: TextStyle(fontSize: 36),
                "Featured recipes",
              )),
          FutureBuilder<List<Recipe>>(
              future: RecipeApi().findAllRecipes(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Recipe>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading recipes");
                } else if (snapshot.hasError) {
                  return const Text("Error retrieving recipes");
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text("Recipe not found");
                }
                return RecipeCardWidget(snapshot.data![0]);
              }),
          Container(
              margin: const EdgeInsets.all(5),
              child: const Text(
                style: TextStyle(fontSize: 36),
                "Featured categories",
              )),
          FutureBuilder<List<Category>>(
              future: CategoryApi().findCategorySubset(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Category>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading categories");
                } else if (snapshot.hasError) {
                  return const Text("Error retrieving categories");
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text("Category not found");
                }
                return Column(
                  children: snapshot.data!
                      .map((category) => Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(5),
                                child: Text(
                                  style: TextStyle(fontSize: 36),
                                  snapshot.data![0].name,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(5),
                                child: Placeholder(),
                              ),
                            ],
                          ))
                      .toList(),
                );
              }),
          TextButton(
              child: Text("View all categories"),
              onPressed: () => context.go('/category')),
        ],
      )),
    );
  }
}
