import 'package:my_shop/api/models/Product.dart';
import 'package:provider/provider.dart';

class CreateProductBloc {

  Product _product = Product();

  set name(String name) {
    _product.name = name;
    }

  set price(String price) {
    _product.price =price;
  }

  set imageUrl(String image) {
    _product.imageUrl = image;
  }

  set userId(String id) {
    _product.userId = id;
  }

  Product get product => _product;

}
