import 'package:flutter/material.dart';
import 'package:my_shop/api/models/Product.dart';
import 'package:my_shop/screens/product/product_tile.dart';
import 'package:my_shop/utils/loading.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<List<Product>>(context);

    return products == null
        ? Loading(
            color: Colors.blue,
          )
        : ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductTile(product: products[index]);
            });
  }
}
