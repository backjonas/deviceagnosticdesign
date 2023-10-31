class Category {
  final String id;
  final String name;
  final String picture;

  Category({
    required this.id,
    required this.name,
    required this.picture,
  });

  factory Category.fromFirestore(Map<String, dynamic> data, String id) {
    return Category(
      id: id,
      name: data['name'],
      picture: data['picture'],
    );
  }
}
