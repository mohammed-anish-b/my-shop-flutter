import 'package:flutter/material.dart';
import 'package:my_shop/blocs/tab-switch-bloc.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigater extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final _tabSwitchBloc = Provider.of<TabSwitchBloc>(context);

    return BottomNavigationBar(
      currentIndex: _tabSwitchBloc.index,
      onTap: (index) {
        _tabSwitchBloc.switchTab(index);
      },
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.store),
          title: new Text('Store'),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart), title: Text('Cart'))
      ],
    );
  }
}
