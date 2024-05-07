import 'dart:convert';

import 'cart.dart';

class Cards {
  List<Cart>? carts;
  int? total;
  int? skip;
  int? limit;

  Cards({this.carts, this.total, this.skip, this.limit});

  @override
  String toString() {
    return 'Cards(carts: $carts, total: $total, skip: $skip, limit: $limit)';
  }

  factory Cards.fromMap(Map<String, dynamic> data) => Cards(
        carts: (data['carts'] as List<dynamic>?)
            ?.map((e) => Cart.fromMap(e as Map<String, dynamic>))
            .toList(),
        total: data['total'] as int?,
        skip: data['skip'] as int?,
        limit: data['limit'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'carts': carts?.map((e) => e.toMap()).toList(),
        'total': total,
        'skip': skip,
        'limit': limit,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Cards].
  factory Cards.fromJson(String data) {
    return Cards.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Cards] to a JSON string.
  String toJson() => json.encode(toMap());
}
