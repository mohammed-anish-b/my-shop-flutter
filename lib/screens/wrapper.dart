import 'package:flutter/material.dart';
import 'package:my_shop/screens/authenticate/authendicate.dart';
import 'package:my_shop/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<FirebaseUser>(context);

    if(user == null) {
      return Authendicate();
    } else {
      return Home();
    }
  }
}