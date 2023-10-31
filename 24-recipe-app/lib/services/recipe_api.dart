import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipe_app/models/recipe.dart';

class RecipeApi {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Recipe>> findAllRecipes() async {
    final snapshot = await _firestore.collection('recipe').get();
    return snapshot.docs.map((doc) {
      return Recipe.fromFirestore(doc.data(), doc.id);
    }).toList();
  }

  Future<List<Recipe>> findRecipesByCategory(String categoryId) async {
    final snapshot = await _firestore
        .collection('recipe')
        .where('category_id', isEqualTo: categoryId)
        .get();
    final res = snapshot.docs.map((doc) {
      return Recipe.fromFirestore(doc.data(), doc.id);
    }).toList();
    return res;
  }

  Future<List<Recipe>> findRecipeById(String recipeId) async {
    final snapshot = await _firestore.collection('recipe').doc(recipeId).get();
    if (snapshot.data() == null) {
      return [];
    }
    return [Recipe.fromFirestore(snapshot.data()!, snapshot.id)];
  }
}
