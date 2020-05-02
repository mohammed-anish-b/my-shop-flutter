import 'package:flutter/material.dart';
import 'package:my_shop/services/auth-service.dart';
import 'package:my_shop/utils/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String password;

  String email;

  final AuthService _auth = AuthService.getInstance;
  final _login = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(70))),
          backgroundColor: Colors.blueGrey,
            expandedHeight: 150.0,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Login'),
            ),
            floating: true,
            actions: <Widget>[
              FlatButton.icon(
                  onPressed: () {
                    widget.toggleView();
                  },
                  icon: Icon(Icons.person, color: Colors.white),
                  label: Text(
                    "Register",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(40.0),
                          topRight: const Radius.circular(40.0))),
                  child: Form(
                      key: _login,
                      child: Padding(
                        padding: EdgeInsets.all(23),
                        child: ListView(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Container(
                                child: TextFormField(
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'SFUIDisplay'),
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
                                        color: Colors.black,
                                        fontFamily: 'SFUIDisplay'),
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Password',
                                        prefixIcon: Icon(Icons.lock_outline),
                                        labelStyle: TextStyle(fontSize: 15)),
                                    onChanged: (val) {
                                      this.password = val;
                                    },
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter password';
                                      } else if (value.length < 6) {
                                        return 'Minimum password length is 6';
                                      }
                                      return null;
                                    }),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: MaterialButton(
                                onPressed: () async {
                                  if (_login.currentState.validate()) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    dynamic result =
                                        await _auth.signInWithEmailAndPassword(
                                            email, password);

                                    if (result == null) {
                                      setState(() {
                                        isLoading = false;
                                      });
                                    }
                                  }
                                },
                                child: isLoading
                                    ? Loading(color: Colors.white)
                                    : Text(
                                        'LOGIN ',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'SFUIDisplay',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                color: Colors.blue,
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
