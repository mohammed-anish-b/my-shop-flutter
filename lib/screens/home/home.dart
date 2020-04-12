import 'package:flutter/material.dart';
import 'package:my_shop/screens/tabs/settings.dart';
import 'package:my_shop/screens/tabs/store.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex = 1;

  final List<Widget> _children = [
    Store(),
    Settings(),
    Container(color: Colors.green)
  ];

  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      bottomNavigationBar: BottomNavigationBar(
       currentIndex: _currentIndex,
       onTap: onTabTapped,
       backgroundColor:  Colors.white,

       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.store),
           title: new Text('Store'),
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.settings),
           title: Text('Settings')
         )
       ],
     ),
    floatingActionButton: FloatingActionButton(
      onPressed: null,
      child: Icon(Icons.add),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _children[this._currentIndex],
    );
  }

  void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }
  
}