import 'package:flutter/material.dart';
import 'package:my_shop/api/services/checkout-service.dart';
import 'package:my_shop/blocs/cart-bloc.dart';
import 'package:my_shop/blocs/tab-switch-bloc.dart';
import 'package:provider/provider.dart';

class BottomActionButon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _tabSwitchBloc = Provider.of<TabSwitchBloc>(context);
    final _cartBloc = Provider.of<CartBloc>(context);
    final _checkoutService = Provider.of<CheckoutService>(context);

    return _tabSwitchBloc.index == 0
        ? FlatButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, "create-product");
            },
            color: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            icon: Icon(Icons.add, color: Colors.white),
            label: Text("Add product", style: TextStyle(color: Colors.white)))
        : FlatButton.icon(
            color: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            icon: Icon(
              Icons.shopping_basket,
              color: Colors.white,
            ),
            label: Text('INR ${_cartBloc.total}',
                style: TextStyle(color: Colors.white)),
            onPressed: () {
              _checkoutService.checkout(_cartBloc.checkoutData, () {
                _cartBloc.clear();
                _tabSwitchBloc.switchTab(0);
                Scaffold.of(context).showSnackBar(SnackBar(
                    content: Row(children: [
                  IconButton(
                      icon: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                      onPressed: null),
                  Text(
                    'Checkout Success',
                    style: TextStyle(color: Colors.green),
                  )
                ])));
              }, (val) {
                Scaffold.of(context).showSnackBar(SnackBar(
                    content: Row(children: [
                  IconButton(
                      icon: Icon(
                        Icons.warning,
                        color: Colors.red,
                      ),
                      onPressed: null),
                  Text(
                    'Checkout failed',
                    style: TextStyle(color: Colors.red),
                  )
                ])));
              });
            });
  }
}
