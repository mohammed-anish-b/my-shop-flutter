import 'package:flutter/material.dart';
import 'package:my_shop/services/auth-service.dart';
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
      backgroundColor: Colors.blue,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 150.0,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Register'),
            ),
            floating: true,
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
                                  if (_signup.currentState.validate()) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    dynamic result = await _auth
                                        .registerWithEmailAndPassword(
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
                                        'REGISTER ',
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
