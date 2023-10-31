import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipe_app/models/category.dart';

class CategoryApi {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Category>> findAllCategories() async {
    final snapshot = await _firestore.collection('category').get();
    return snapshot.docs.map((doc) {
      return Category.fromFirestore(doc.data(), doc.id);
    }).toList();
  }
}
