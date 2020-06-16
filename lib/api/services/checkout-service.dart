import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_shop/api/models/sale.dart';

class CheckoutService {
  CollectionReference _saleCollection = Firestore.instance.collection('sale');
  CollectionReference _productLineCollection =
      Firestore.instance.collection('productline');

  checkout(Sale sale, Function success, Function onError) {
    this
        ._saleCollection
        .add({"time": DateTime.now(), "total": sale.total}).then((value) {
      sale.productLineitems.forEach((element) {
        this._productLineCollection.add({
          "id": element.id,
          "productId": element.product.uid,
          "count": element.count,
          "saleId": value.documentID
        });
      });
      success();
    }).catchError((val) => onError(val));
  }
}
