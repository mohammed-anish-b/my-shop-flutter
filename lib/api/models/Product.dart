class Product {
  String uid;
  String name;
  String price;
  String imageUrl;
  String userId;
  
  static Product fromJson(json,String id) {

    Product p = Product();
    p.name = json['name'];
    p.price = json['price'];
    p.imageUrl =json['imageUrl'];
    p.uid = id;
    p.userId = json['userId'];
    return p;
  }

  @override
  String toString() {
    return '$uid + $name + $price + $imageUrl + $userId';
  }

  int hashcode() {
    return name.hashCode;
  }
  
}