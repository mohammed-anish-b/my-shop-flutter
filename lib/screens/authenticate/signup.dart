import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_shop/blocs/loading-bloc.dart';
import 'package:my_shop/blocs/login-signup-bloc.dart';
import 'package:my_shop/blocs/login-signup-toggle-bloc.dart';
import 'package:my_shop/services/auth-service.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  final _signup = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _loginSignupToggleBloc = Provider.of<LoginSignupToggleBloc>(context);
    final _loginSignupBloc = Provider.of<LoginSignupBloc>(context);
    final _authService = Provider.of<AuthService>(context);
    final _loadingBloc = Provider.of<LoadingBloc>(context);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20, 70, 0, 10),
            child: Text("Sign Up",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
          ),
          Form(
            key: _signup,
              child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                      child: TextFormField(
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'SFUIDisplay'),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.lock_outline),
                              labelStyle: TextStyle(fontSize: 15)),
                          onChanged: (val) {
                            _loginSignupBloc.email = val;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter email';
                            }
                            return null;
                          }))),
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  child: TextFormField(
                      obscureText: true,
                      style: TextStyle(
                          color: Colors.black, fontFamily: 'SFUIDisplay'),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock_outline),
                          labelStyle: TextStyle(fontSize: 15)),
                      onChanged: (val) {
                        _loginSignupBloc.password = val;
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
                padding: EdgeInsets.all(20),
                child: Container(
                  child: TextFormField(
                    obscureText: true,
                    style: TextStyle(
                        color: Colors.black, fontFamily: 'SFUIDisplay'),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        labelText: 'Repeat Password',
                        prefixIcon: Icon(Icons.lock_outline),
                        labelStyle: TextStyle(fontSize: 15)),
                    onChanged: (val) {
                      _loginSignupBloc.repeat = val;
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter repeat password';
                      } else if (value != _loginSignupBloc.password) {
                        return 'Password mismatch';
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ],
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Checkbox(
                  value: _loginSignupBloc.agree,
                  onChanged: (val) => _loginSignupBloc.agree = val),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'I Agree with ',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                TextSpan(
                    text: 'privacy ',
                    style: TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.bold)),
                TextSpan(
                    text: 'and ',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                TextSpan(
                    text: 'policy ',
                    style: TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.bold))
              ]))
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 30, 20, 10),
              child: Container(
                decoration: BoxDecoration(
                    color: _loginSignupBloc.agree ? Colors.lightGreenAccent[700] : Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: _loadingBloc.isLoading ? SpinKitDoubleBounce(color: Colors.white,): IconButton(
                    onPressed: () async {
                      if (_loginSignupBloc.agree && _signup.currentState.validate()) {
                        await _authService.registerWithEmailAndPassword(
                            _loginSignupBloc.email, _loginSignupBloc.password);
                      } else {}
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    )),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: FlatButton(
                onPressed: () => _loginSignupToggleBloc.togglecurrentTab(0),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Already have an account ?",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: " Login",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold))
                ]))),
          )
        ],
      ),
    );
  }
}
