import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipe_app/models/category.dart';
import './recipe_api.dart';

class CategoryApi {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Category>> findAllCategories() async {
    final snapshot = await _firestore.collection('category').get();
    return Future.wait(snapshot.docs.map((doc) async {
      final recipes = await RecipeApi().findRecipesByCategory(doc.id);
      return Category.fromFirestoreWithRecipe(
        doc.data(),
        doc.id,
        recipes,
      );
    }));
  }

  Future<List<Category>> findCategory(String categoryId) async {
    final snapshot =
        await _firestore.collection('category').doc(categoryId).get();
    if (snapshot.data() == null) {
      return [];
    }
    final recipes = await RecipeApi().findRecipesByCategory(categoryId);
    return [
      Category.fromFirestoreWithRecipe(
        snapshot.data()!,
        snapshot.id,
        recipes,
      )
    ];
  }

  Future<List<Category>> findCategorySubset() async {
    final snapshot = await _firestore.collection('category').limit(2).get();
    return Future.wait(snapshot.docs.map((doc) async {
      final recipes = await RecipeApi().findRecipesByCategory(doc.id);
      return Category.fromFirestoreWithRecipe(
        doc.data(),
        doc.id,
        recipes,
      );
    }));
  }
}
