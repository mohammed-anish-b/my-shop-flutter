import 'package:flutter/material.dart';
import 'package:my_shop/services/authservice.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthService _auth = AuthService();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: Icon(Icons.power_settings_new , color: Colors.white),
            label: Text("LogOut", style: TextStyle(color: Colors.white),))
        ],
      ),
    );
  }
}