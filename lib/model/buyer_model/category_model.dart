class Category {
  final int id;
  final String name;
  final List<SubCategory> subCategories;

  Category({
    required this.id,
    required this.name,
    required this.subCategories,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      subCategories: (json['subCategories'] as List)
          .map((e) => SubCategory.fromJson(e))
          .toList(),
    );
  }
}

class SubCategory {
  final int id;
  final String name;
  final List<Product> products;

  SubCategory({
    required this.id,
    required this.name,
    required this.products,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['id'],
      name: json['name'],
      products: (json['products'] as List)
          .map((e) => Product.fromJson(e))
          .toList(),
    );
  }
}

class Product {
  final int id;
  final String title;
  final String image;
  final double price;
  final bool isPremium;
  final int discount;

  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.isPremium,
    required this.discount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      price: (json['price'] as num).toDouble(),
      isPremium: json['isPremium'],
      discount: json['discount'],
    );
  }
}
