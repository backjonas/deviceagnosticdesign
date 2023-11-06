import 'package:flutter/material.dart';
import 'package:recipe_app/widgets/category.dart';
import 'package:recipe_app/layout/screen_wrapper.dart';

class CategoryScreen extends StatelessWidget {
  final String categoryId;
  const CategoryScreen(this.categoryId);

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      CategoryWidget(categoryId),
    );
  }
}
