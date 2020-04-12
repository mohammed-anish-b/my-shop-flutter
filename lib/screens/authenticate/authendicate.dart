import 'package:flutter/material.dart';
import 'package:my_shop/screens/authenticate/register.dart';
import 'package:my_shop/screens/authenticate/signin.dart';

class Authendicate extends StatefulWidget {
  @override
  _AuthendicateState createState() => _AuthendicateState();
}

class _AuthendicateState extends State<Authendicate> {

  bool onlogin = true;

  void toggleView() {
    setState(() {
      this.onlogin = !this.onlogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (onlogin) {
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}