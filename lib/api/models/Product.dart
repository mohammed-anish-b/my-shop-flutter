class Product {
  String name;
  int price;
  String imageUrl;

  Product(String name, int price, String imageUrl){
    this.name = name;
    this.price = price;
    this.imageUrl = imageUrl;
  }

  static Product fromJson(json) {
    return Product(json["name"], json["price"], json["imageUrl"]);
  }
}