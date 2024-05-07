import 'dart:convert';

class Product {
  int? id;
  String? title;
  int? price;
  int? quantity;
  int? total;
  double? discountPercentage;
  int? discountedPrice;
  String? thumbnail;

  Product({
    this.id,
    this.title,
    this.price,
    this.quantity,
    this.total,
    this.discountPercentage,
    this.discountedPrice,
    this.thumbnail,
  });

  @override
  String toString() {
    return 'Product(id: $id, title: $title, price: $price, quantity: $quantity, total: $total, discountPercentage: $discountPercentage, discountedPrice: $discountedPrice, thumbnail: $thumbnail)';
  }

  factory Product.fromMap(Map<String, dynamic> data) => Product(
        id: data['id'] as int?,
        title: data['title'] as String?,
        price: data['price'] as int?,
        quantity: data['quantity'] as int?,
        total: data['total'] as int?,
        discountPercentage: (data['discountPercentage'] as num?)?.toDouble(),
        discountedPrice: data['discountedPrice'] as int?,
        thumbnail: data['thumbnail'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'price': price,
        'quantity': quantity,
        'total': total,
        'discountPercentage': discountPercentage,
        'discountedPrice': discountedPrice,
        'thumbnail': thumbnail,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Product].
  factory Product.fromJson(String data) {
    return Product.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Product] to a JSON string.
  String toJson() => json.encode(toMap());
}
