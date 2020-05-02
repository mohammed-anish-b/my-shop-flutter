class Product {
  String uid;
  String name;
  String price;
  String imageUrl;
  
  static Product fromJson(json,String id) {

    Product p = Product();
    p.name = json['name'];
    p.price = json['price'];
    p.imageUrl =json['imageUrl'];
    p.uid = id;
    return p;
  }

  @override
  String toString() {
    return '$uid + $name + $price + $imageUrl';
  }

  int hashcode() {
    return name.hashCode;
  }
  
}