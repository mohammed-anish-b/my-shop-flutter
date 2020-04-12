import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  @override
  // Widget build(BuildContext context) {
  //   return DefaultTabController(
  //     length: 2,
  //     child: TabBar(
  //       labelColor: Colors.blue,
  //       tabs: [
  //         Tab(text: "Products",icon: Icon(Icons.store, color: Colors.blue,)),
  //         Tab(text: "Settings", icon: Icon(Icons.settings,color: Colors.blue,))
  //       ]
  //     )
  //   );
  // }

   Widget build(BuildContext context) {
    return BottomNavigationBar(
       currentIndex: 0, // this will be set when a new tab is tapped
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.home),
           title: new Text('Home'),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.mail),
           title: new Text('Messages'),
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.person),
           title: Text('Profile')
         )
       ],
     );
  }
}