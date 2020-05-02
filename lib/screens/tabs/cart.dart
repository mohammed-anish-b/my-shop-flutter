import 'package:flutter/material.dart';
import 'package:my_shop/blocs/cart-bloc.dart';
import 'package:my_shop/screens/cart/cart-tile.dart';
import 'package:my_shop/screens/cart/emptycart.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {

    final _cartBloc = Provider.of<CartBloc>(context);

    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(70))),
          backgroundColor: Colors.blueGrey,
          expandedHeight: 150.0,
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
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Cart',style: TextStyle(color: Colors.white,fontSize: 30),),
                      )
                    ],
                  ),
                ),
          floating: true,
          actions: <Widget>[
            FlatButton.icon(onPressed: () => _cartBloc.clear(), icon: Icon(Icons.remove_shopping_cart , color: Colors.white,), label: Text('Clear', style: TextStyle( color: Colors.white),))
          ],
        ),
        _cartBloc.product.length == 0 ? SliverList(delegate: SliverChildBuilderDelegate ((context,index) => EmptyCart(),childCount: 1)) : SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => CartTile(productLineitem: _cartBloc.product[index]),
                childCount: _cartBloc.product.length)),
      ],
    );
  }
}
