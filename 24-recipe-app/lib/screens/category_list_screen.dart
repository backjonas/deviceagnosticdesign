import 'package:flutter/material.dart';
import 'package:recipe_app/layout/screen_wrapper.dart';
import 'package:recipe_app/widgets/category_list.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen();

  @override
  Widget build(BuildContext context) {
    return const ScreenWrapper(
      Center(child: CategoryList()),
    );
  }
}
