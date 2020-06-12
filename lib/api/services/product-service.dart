import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_shop/api/models/Product.dart';
import 'package:my_shop/services/auth-service.dart';

class ProductService {
  static ProductService _instance;

  FirebaseUser user;

  CollectionReference productCollection =
      Firestore.instance.collection('product');

  static ProductService get getInstance {
    if (_instance == null) {
      _instance = ProductService();
    }
    return _instance;
  }

  // getUser() {
  //   AuthService.getInstance.user.forEach((element) {
  //     user = element;
  //     print('2 $user');
  //   });
  // }

  List<Product> _productFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Product.fromJson(doc, doc.documentID);
    }).toList();
  }

  Stream<List<Product>> getproducts(FirebaseUser user) {
    this.user = user;
    return productCollection
        .where('userId',isEqualTo: user.uid)
        .snapshots()
        .map(_productFromSnapshot);
  }

  Future<DocumentReference> createProduct(Product product) {
    return productCollection.add({
      'id': product.uid,
      'name': product.name,
      'price': product.price,
      'imageUrl': product.imageUrl,
      'userId': product.userId
    });
  }

  void deleteProduct(String uid) {
    productCollection.document(uid).delete();
  }
}
