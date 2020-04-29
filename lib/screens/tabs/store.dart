import 'package:flutter/material.dart';
import 'package:my_shop/api/models/Product.dart';
import 'package:my_shop/screens/product/product_tile.dart';
import 'package:my_shop/services/auth-service.dart';
import 'package:my_shop/utils/loading.dart';
import 'package:provider/provider.dart';

class Store extends StatelessWidget {
  final AuthService _auth = AuthService.getInstance;

  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<List<Product>>(context);

    return products == null
        ? Loading(color: Colors.blue)
        : CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 150.0,
                flexibleSpace: const FlexibleSpaceBar(
                  title: Text('Products'),
                ),
                floating: true,
                actions: <Widget>[
                  FlatButton.icon(
                      onPressed: () async {
                        await _auth.signOut();
                      },
                      icon: Icon(Icons.power_settings_new, color: Colors.white),
                      label: Text(
                        "LogOut",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => ProductTile(product: products[index]),
                    childCount: products.length)
              ),
            ],
          );
  }
}
