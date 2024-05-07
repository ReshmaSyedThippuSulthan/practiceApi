import 'dart:convert';

import 'product.dart';

class Cart {
  int? id;
  List<Product>? products;
  int? total;
  int? discountedTotal;
  int? userId;
  int? totalProducts;
  int? totalQuantity;

  Cart({
    this.id,
    this.products,
    this.total,
    this.discountedTotal,
    this.userId,
    this.totalProducts,
    this.totalQuantity,
  });

  @override
  String toString() {
    return 'Cart(id: $id, products: $products, total: $total, discountedTotal: $discountedTotal, userId: $userId, totalProducts: $totalProducts, totalQuantity: $totalQuantity)';
  }

  factory Cart.fromMap(Map<String, dynamic> data) => Cart(
        id: data['id'] as int?,
        products: (data['products'] as List<dynamic>?)
            ?.map((e) => Product.fromMap(e as Map<String, dynamic>))
            .toList(),
        total: data['total'] as int?,
        discountedTotal: data['discountedTotal'] as int?,
        userId: data['userId'] as int?,
        totalProducts: data['totalProducts'] as int?,
        totalQuantity: data['totalQuantity'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'products': products?.map((e) => e.toMap()).toList(),
        'total': total,
        'discountedTotal': discountedTotal,
        'userId': userId,
        'totalProducts': totalProducts,
        'totalQuantity': totalQuantity,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Cart].
  factory Cart.fromJson(String data) {
    return Cart.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Cart] to a JSON string.
  String toJson() => json.encode(toMap());
}
