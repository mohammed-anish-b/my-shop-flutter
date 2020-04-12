import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/services/authservice.dart';
import 'package:my_shop/utils/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String password;

  String email;

  bool isLoading = false;

  final AuthService _auth = AuthService.getInstance;
  final _signup = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person, color: Colors.white),
              label: Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: Form(
          key: _signup,
          child: Padding(
            padding: EdgeInsets.all(23),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Container(
                    child: TextFormField(
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'SFUIDisplay'),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.lock_outline),
                            labelStyle: TextStyle(fontSize: 15)),
                        onChanged: (val) {
                          this.email = val;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter email';
                          }
                          return null;
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Container(
                    child: TextFormField(
                      obscureText: true,
                      style: TextStyle(
                          color: Colors.black, fontFamily: 'SFUIDisplay'),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline),
                          labelStyle: TextStyle(fontSize: 15)),
                      onChanged: (val) {
                        this.password = val;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: MaterialButton(
                    onPressed: () async {
                      if (_signup.currentState.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        dynamic result = await _auth
                            .registerWithEmailAndPassword(email, password);
                        if (result == null) {
                          setState(() {
                            isLoading = false;
                          });
                        }
                      }
                    },
                    child: isLoading ? Loading(): Text(
                      'Register ',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'SFUIDisplay',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Color(0xffff2d55),
                    elevation: 0,
                    minWidth: 400,
                    height: 50,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
