import 'package:flutter/material.dart';
import 'package:recipe_app/services/category_api.dart';
import 'package:recipe_app/models/category.dart';
import 'package:recipe_app/widgets/category_card.dart';

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
            return ListView(
                scrollDirection: Axis.vertical,
                children: snapshot.data!
                    .map((category) => CategoryCardWidget(category))
                    .toList());
          }
        });
  }
}
