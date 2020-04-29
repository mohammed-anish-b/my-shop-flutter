import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_shop/api/models/Product.dart';

class ProductService {

  static ProductService _instance;

  static ProductService get getInstance {
    if (_instance == null) {
      _instance = ProductService();
    }
    return _instance;
  }

  final CollectionReference productCollection = Firestore.instance.collection('product');

  List<Product> _productFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      print(doc);
      return Product.fromJson(doc,doc.documentID);
    }).toList();
  }

  Stream<List<Product>> get products{
    return productCollection.snapshots().map(_productFromSnapshot);
  }

   Future<DocumentReference> createProduct(Product product) {
    print(product);
    return productCollection.add({
      'id':product.uid,
      'name': product.name,
      'price': product.price,
      'imageUrl': product.imageUrl
      });
  }

  void deleteProduct(String uid) {
    print("delete $uid");
    productCollection.document(uid).delete();
  }
}