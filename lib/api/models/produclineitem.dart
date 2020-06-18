import 'package:my_shop/api/models/Product.dart';

class ProductLineitem {
  String id;
  Product product;
  String productId;
  int count = 1;

  ProductLineitem({this.product});

  static ProductLineitem fromJson(json, String id) {
    ProductLineitem p = ProductLineitem();
    p.id = id;
    p.count = json['count'];
    p.productId = json['productId'];
    return p;
  }

  @override
  String toString() {
    return '$id + $count +$product';
  }
}
