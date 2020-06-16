import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseUser _user = Provider.of<FirebaseUser>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: _user.displayName == null
                ? Text(_user.uid)
                : Text(_user.displayName.toString()),
            accountEmail: Text(_user.email.toString()),
            currentAccountPicture: FlutterLogo(),
            decoration: BoxDecoration(color: Colors.black87),
            onDetailsPressed: () {},
            arrowColor: Colors.blue,
            otherAccountsPictures: [
              FlutterLogo(
                colors: Colors.red,
              ),
              FlutterLogo(
                colors: Colors.green,
              )
            ],
          ),
          ListTile(
            leading: IconButton(icon: Icon(Icons.home), onPressed: null),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushReplacementNamed(context, 'home');
            },
          ),
          ListTile(
            leading: IconButton(icon: Icon(Icons.history), onPressed: null),
            title: Text('Sale History'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushReplacementNamed(context, 'sale-history');
            },
          ),
          ListTile(
            leading: IconButton(icon: Icon(Icons.settings), onPressed: null),
            title: Text('Settings'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
