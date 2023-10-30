import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';
import '../screens/category_list_screen.dart';
import '../screens/recipe_list_screen.dart';
import '../screens/recipe_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
    GoRoute(
        path: '/category', builder: (context, state) => CategoryListScreen()),
    GoRoute(
        path: '/category/:categoryId',
        builder: (context, state) =>
            RecipeListScreen(int.parse(state.pathParameters['categoryId']!))),
    GoRoute(
        path: '/recipe/:recipeId',
        builder: (context, state) =>
            RecipeScreen(int.parse(state.pathParameters['recipeId']!)))
  ],
);
