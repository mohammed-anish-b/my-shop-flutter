import 'package:cloud_firestore/cloud_firestore.dart';

class ProductService {

  final CollectionReference productCollection = Firestore.instance.collection('product');
}