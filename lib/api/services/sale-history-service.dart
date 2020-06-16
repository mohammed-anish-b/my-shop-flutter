import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_shop/api/models/produclineitem.dart';
import 'package:my_shop/api/models/sale.dart';

class SaleHistoryService {
  CollectionReference _saleCollection = Firestore.instance.collection('sale');
  CollectionReference _productLineCollection =
      Firestore.instance.collection('productline');

  List<Sale> sales = [];

  Stream<List<Sale>> getSaleHistory(DateTime date) {
    log('From '+date
        .subtract(new Duration(
            hours: date.hour,
            minutes: date.minute,
            seconds: date.second,
            microseconds: date.microsecond,
            milliseconds: date.millisecond))
        .toString());
        log('to '+date.toString());
    return _saleCollection
        .where('time',
            isLessThanOrEqualTo: Timestamp.fromMicrosecondsSinceEpoch(
                date.add(new Duration(days: 1)).microsecondsSinceEpoch))
        .where('time',
            isGreaterThan: Timestamp.fromMicrosecondsSinceEpoch(date
                .subtract(new Duration(
                    hours: date.hour,
                    minutes: date.minute,
                    seconds: date.second,
                    microseconds: date.microsecond,
                    milliseconds: date.millisecond))
                .microsecondsSinceEpoch))
        .snapshots()
        .map(_saleFromSnapshot);
    //     .getDocuments()
    //     .then((snapshot) {
    //   this.sales = _saleFromSnapshot(snapshot);
    // });
  }

  List<Sale> _saleFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      log(doc.documentID);
      //getProductLineItemFromSaleId(doc.documentID);
      return Sale.fromJson(doc, doc.documentID);
    }).toList();
  }

  getProductLineItemFromSaleId(id) async {
    await _productLineCollection
        .where('saleId', isEqualTo: id)
        .getDocuments()
        .then((snapshot) {
      List<ProductLineitem> pl = _productLineFromSnapshot(snapshot);
      sales.forEach((element) {
        if (element.id == id) {
          element.productLineitems = pl;
        }
      });
    });
  }

  List<ProductLineitem> _productLineFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return ProductLineitem.fromJson(doc, doc.documentID);
    }).toList();
  }
}
