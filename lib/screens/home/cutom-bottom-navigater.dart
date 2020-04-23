import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/blocs/current-tab-bloc.dart';

class CustomBottomNavigater extends StatefulWidget {
  @override
  _CustomBottomNavigaterState createState() => _CustomBottomNavigaterState();
}

class _CustomBottomNavigaterState extends State<CustomBottomNavigater> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final _tabSwitchBloc = BlocProvider.of<TabSwitchBloc>(context);
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() => _currentIndex = index);
        _tabSwitchBloc.add(TabChangeEvent(data: index));
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
