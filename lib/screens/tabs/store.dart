import 'package:flutter/material.dart';
import 'package:my_shop/api/models/Product.dart';
import 'package:my_shop/api/services/product-service.dart';
import 'package:my_shop/screens/product/product_list.dart';
import 'package:my_shop/services/auth-service.dart';
import 'package:provider/provider.dart';

class Store extends StatelessWidget {
  final AuthService _auth = AuthService.getInstance;
  final ProductService _productService = ProductService.getInstance;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
          delegate: SliverChildListDelegate(
            <Widget>[
              StreamProvider<List<Product>>.value(
                value: _productService.products,
                child: Container(
                  height: 500.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0))),
                  child: SafeArea(child: Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,0,52),
                    child: ProductList(),
                  )),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
