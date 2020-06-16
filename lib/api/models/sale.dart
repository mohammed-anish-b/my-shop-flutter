import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_shop/api/models/produclineitem.dart';

class Sale {
  
  String id;
  List<ProductLineitem> productLineitems;
  int total;
  DateTime time;

  static Sale fromJson(json,String id) {
    Sale s = Sale();
    s.id = id;
    s.total = json['total'];
    s.time = DateTime.fromMicrosecondsSinceEpoch(json['time'].microsecondsSinceEpoch);
    return s;
  }
  
  @override
  String toString() {
    return '$id + $total + $time';
  }

}