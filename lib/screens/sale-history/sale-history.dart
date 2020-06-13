import 'package:flutter/material.dart';
import 'package:my_shop/shared/sidemenu.dart';

class SaleHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      body: CustomScrollView(
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
                SizedBox(width: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Sale History',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                )
              ],
            ),
          ),
          floating: true,
          actions: <Widget>[
           
          ],
        ),
      ],
    )
    );
  }
}