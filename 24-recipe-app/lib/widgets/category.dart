import 'package:flutter/material.dart';
import 'package:recipe_app/models/category.dart';
import 'package:recipe_app/services/category_api.dart';
import 'package:recipe_app/widgets/recipe_list.dart';

class CategoryWidget extends StatelessWidget {
  final String categoryId;
  const CategoryWidget(this.categoryId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
        future: CategoryApi().findCategory(categoryId),
        builder:
            (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading recipes");
          } else if (snapshot.hasError) {
            return const Text("Error retrieving recipes");
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text("Category not found");
          } else {
            final category = snapshot.data![0];
            return Column(children: [
              Container(
                margin: const EdgeInsets.all(5),
                child: Text(
                  style: TextStyle(fontSize: 36),
                  category.name,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: Placeholder(),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 10),
                  child:
                      const Text('Click a recipe to view its full contents.')),
              RecipeListWidget(category.recipes)
            ]);
          }
        });
  }
}
