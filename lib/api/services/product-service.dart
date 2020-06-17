import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_shop/api/models/Product.dart';

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

  Stream<List<Product>> getProduct(String query, FirebaseUser user) {
    if(query == null || query == '') {
      return getproducts(user);
    } else {
      return searchProducts(query, user);
    }
  }

  List<Product> _productsFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Product.fromJson(doc, doc.documentID);
    }).toList();
  }

  Stream<List<Product>> getproducts(FirebaseUser user) {
    this.user = user;
    return productCollection
        .where('userId', isEqualTo: user.uid)
        .snapshots()
        .map(_productsFromSnapshot);
  }

  Stream<List<Product>> searchProducts(String query, FirebaseUser user) {
    this.user = user;
    String lessThanQueryString = query.substring(0, query.length-1) +
        String.fromCharCode(query.codeUnitAt(query.length - 1) + 1);
        print(lessThanQueryString);
    return productCollection
        .where('userId', isEqualTo: user.uid)
        .where('name', isGreaterThan: query)
        .where('name', isLessThan: lessThanQueryString)
        .snapshots()
        .map(_productsFromSnapshot);
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

  Stream<Product> getProductFromProductId(id) {
    this.user = user;
    return productCollection.document(id).snapshots().map(_productFromSnapshot);
  }

  Product _productFromSnapshot(DocumentSnapshot doc) {
    return Product.fromJson(doc, doc.documentID);
  }
}
