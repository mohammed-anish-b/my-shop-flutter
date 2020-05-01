import 'package:flutter/material.dart';
import 'package:my_shop/api/models/Product.dart';
import 'package:my_shop/screens/product/product_tile.dart';
import 'package:my_shop/services/auth-service.dart';
import 'package:my_shop/utils/loading.dart';
import 'package:provider/provider.dart';
import 'package:my_shop/blocs/product-view-bloc.dart';

class Store extends StatelessWidget {
  final AuthService _auth = AuthService.getInstance;

  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<List<Product>>(context);
    final _productViewBloc = Provider.of<ProductViewBloc>(context);

    return products == null
        ? Loading(color: Colors.blue)
        : CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(70))),
                backgroundColor: Colors.blueGrey,
                expandedHeight: 150.0,
                title: Text("Product"),
                //leading: Icon(Icons.fastfood),
                forceElevated: true,
                flexibleSpace: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                            onPressed: null),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 15, 35, 12),
                        child: SizedBox(
                          height: 50,
                          width: 300,
                          child: TextFormField(
                            decoration: InputDecoration(
                              //icon: IconButton(icon: Icon(Icons.menu , color: Colors.white,), onPressed: null),

                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Search products....",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                      (context, index) => Container(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  IconButton(
                                      icon: Icon(Icons.apps),
                                      onPressed: () => _productViewBloc
                                          .viewType = ViewType.GRIDVIEW),
                                  IconButton(
                                      icon: Icon(Icons.menu),
                                      onPressed: () => _productViewBloc
                                          .viewType = ViewType.LISTVIEW)
                                ],
                              ),
                            ),
                          ),
                      childCount: 1)),
              _productViewBloc.viewType == ViewType.GRIDVIEW
                  ? SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                          (context, index) =>
                              ProductTileGrid(product: products[index]),
                          childCount: products.length),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 300,
                          crossAxisSpacing: 3,
                          childAspectRatio: 0.90))
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (context, index) =>
                              ProductTileList(product: products[index]),
                          childCount: products.length))
            ],
          );
  }
}
