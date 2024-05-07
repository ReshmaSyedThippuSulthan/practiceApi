import 'dart:convert';

import 'product.dart';

class ProductsData {
  List<Product>? products;
  int? total;
  int? skip;
  int? limit;

  ProductsData({this.products, this.total, this.skip, this.limit});

  @override
  String toString() {
    return 'ProductsData(products: $products, total: $total, skip: $skip, limit: $limit)';
  }

  factory ProductsData.fromMap(Map<String, dynamic> data) => ProductsData(
        products: (data['products'] as List<dynamic>?)
            ?.map((e) => Product.fromMap(e as Map<String, dynamic>))
            .toList(),
        total: data['total'] as int?,
        skip: data['skip'] as int?,
        limit: data['limit'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'products': products?.map((e) => e.toMap()).toList(),
        'total': total,
        'skip': skip,
        'limit': limit,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProductsData].
  factory ProductsData.fromJson(String data) {
    return ProductsData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProductsData] to a JSON string.
  String toJson() => json.encode(toMap());
}
