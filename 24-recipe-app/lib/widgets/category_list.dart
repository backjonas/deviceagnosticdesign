import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/services/category_api.dart';
import 'package:recipe_app/models/category.dart';

class CategoryList extends StatelessWidget {
  const CategoryList();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
        future: CategoryApi().findAllCategories(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading categories");
          } else if (snapshot.hasError) {
            return const Text("Error retrieving categories");
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text("No categories available");
          } else {
            return Column(children: [
              Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 10),
                  child: const Text(
                      'Click a category to view recipes belonging to that recipe')),
              ...snapshot.data!.map((category) => Container(
                  margin: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    child: Text(category.name),
                    onPressed: () => context.go('/category/${category.id}'),
                  )))
            ]);
          }
        });
  }
}
