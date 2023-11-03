import 'package:go_router/go_router.dart';
import 'package:recipe_app/screens/home_screen.dart';
import 'package:recipe_app/screens/category_list_screen.dart';
import 'package:recipe_app/screens/recipe_list_screen.dart';
import 'package:recipe_app/screens/recipe_screen.dart';
import 'package:recipe_app/screens/search_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
        path: '/category', builder: (context, state) => CategoryListScreen()),
    GoRoute(
        path: '/category/:categoryId',
        builder: (context, state) =>
            RecipeListScreen(state.pathParameters['categoryId']!)),
    GoRoute(
        path: '/recipe/:recipeId',
        builder: (context, state) =>
            RecipeScreen(state.pathParameters['recipeId']!)),
    GoRoute(
        path: '/search/:query',
        builder: (context, state) =>
            SearchScreen(state.pathParameters['query']!))
  ],
);
