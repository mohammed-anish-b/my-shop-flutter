import 'package:my_shop/api/models/Product.dart';

class ProductLineitem {

    String id;
    Product product;
    int count = 1;

    ProductLineitem({this.product});

}