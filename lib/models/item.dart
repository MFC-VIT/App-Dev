enum FoodCategory { pizza, drinks, desserts, all }

class Item {
  String imageUrl;
  int rating;
  String name;
  int price;
  FoodCategory category;

  Item({
    required this.imageUrl,
    required this.rating,
    required this.name,
    required this.price,
    required this.category,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    late FoodCategory fc;
    switch (json['category']) {
      case 'pizza':
        fc = FoodCategory.pizza;
        break;
      case 'desserts':
        fc = FoodCategory.desserts;
        break;
      case 'drinks':
        fc = FoodCategory.drinks;
        break;
    }
    print(json['category']);
    return Item(
        imageUrl: json['imageUrl'] ?? '',
        name: json['name'] ?? '',
        price: json['price'] ?? '',
        category: fc,
        rating: json['rating'] ?? '');
  }
}
