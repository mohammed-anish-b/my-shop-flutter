import 'package:flutter/cupertino.dart';
import 'package:my_shop/api/models/Product.dart';
import 'package:my_shop/api/models/produclineitem.dart';

class CartBloc extends ChangeNotifier {
  List<ProductLineitem> _products;

  CartBloc() {
    _products = List<ProductLineitem>();
  }

  List<ProductLineitem> get product => _products;

  add(Product product) {
    bool flag = false;
    _products.forEach((ele) {
      if (ele.product.name == product.name) {
        flag = true;
        //return null;
      }
    });
    if (flag) {
      _products.forEach((ele) {
        if (ele.product.name == product.name) ele.count++;
      });
    } else {
      _products.add(new ProductLineitem(product: product));
    }
    notifyListeners();
  }

  remove(Product product) {
    Product tempItem;
    _products.forEach((element) {
      if(element.product == product) {
        element.count > 1 ? element.count-- : tempItem = product;
      }
    });
    removeItem(tempItem);
    notifyListeners();
  }

  removeItem(Product product) {
    ProductLineitem tempItem;
    _products.forEach((element) {
      if (element.product == product) {
        tempItem = element;
      }
    });
    _products.remove(tempItem);
    notifyListeners();
  }

  clear() {
    _products.clear();
    notifyListeners();
  }
}
