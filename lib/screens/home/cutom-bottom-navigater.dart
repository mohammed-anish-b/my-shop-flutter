import 'package:flutter/material.dart';
import 'package:my_shop/blocs/cart-bloc.dart';
import 'package:my_shop/blocs/tab-switch-bloc.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigater extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _tabSwitchBloc = Provider.of<TabSwitchBloc>(context);
    final _cartBloc = Provider.of<CartBloc>(context);

    return BottomNavigationBar(
      currentIndex: _tabSwitchBloc.index,
      onTap: (index) {
        _tabSwitchBloc.switchTab(index);
      },
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          icon: new Icon(
            Icons.store,
            color: Colors.blueGrey,
          ),
          title: new Text(
            'Store',
            style: TextStyle(color: Colors.blueGrey),
          ),
        ),
        BottomNavigationBarItem(
          
            icon: Icon(Icons.shopping_cart,
                color: _cartBloc.product.length > 0
                    ? Colors.green
                    : Colors.blueGrey),
            title: Text(
              'Cart',
              style: TextStyle(
                  color: _cartBloc.product.length > 0
                      ? Colors.green
                      : Colors.blueGrey),
            ))
      ],
    );
  }
}
