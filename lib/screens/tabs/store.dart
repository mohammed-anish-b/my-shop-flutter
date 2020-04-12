import 'package:flutter/material.dart';
import 'package:my_shop/services/authservice.dart';

class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {

  final AuthService _auth = AuthService.getInstance;
  
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
              Container(
                height: 1200.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft:  const  Radius.circular(40.0),
                    topRight: const  Radius.circular(40.0))
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
