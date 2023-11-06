import 'package:flutter/material.dart';
import 'package:recipe_app/models/category.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/layout/breakpoints.dart';
import 'package:recipe_app/widgets/expanded_category.dart';

class CategoryCardWidget extends StatelessWidget {
  final Category category;
  const CategoryCardWidget(this.category);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
        margin: const EdgeInsets.all(20),
        child: InkWell(
            onTap: () => context.go('/category/${category.id}'),
            child: ListTile(
              leading: Container(
                  margin: EdgeInsets.all(10), width: 100, child: Placeholder()),
              title: Container(
                  margin: EdgeInsets.all(10), child: Text(category.name)),
              subtitle: size.width > Breakpoints.sm
                  ? ExpandedCategoryWidget(category.recipes)
                  : null,
            )));
  }
}
