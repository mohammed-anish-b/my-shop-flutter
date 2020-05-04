import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_shop/blocs/loading-bloc.dart';
import 'package:my_shop/blocs/login-signup-bloc.dart';
import 'package:my_shop/blocs/login-signup-toggle-bloc.dart';
import 'package:my_shop/services/auth-service.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  final _login = GlobalKey<FormState>();

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
            child: Text("Login",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
          ),
          Form(
              key: _login,
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                          child: TextFormField(
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'SFUIDisplay'),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25))),
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
                            }
                            return null;
                          }),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 15, 8),
                        child: Container(
                            child: Text(
                          "Forget your password ?",
                          style: TextStyle(color: Colors.grey),
                        )),
                      )),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 30, 20, 10),
                      child: Container(
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.lightGreenAccent[700],
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        child:_loadingBloc.isLoading ? SpinKitDoubleBounce(color: Colors.white,): IconButton(
                            onPressed: () async {
                              _loadingBloc.toggleLoading();
                              if (_login.currentState.validate()) {
                                await _authService.signInWithEmailAndPassword(
                                    _loginSignupBloc.email,
                                    _loginSignupBloc.password).then((value) => _loadingBloc.toggleLoading());
                              }
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ),
                ],
              )),
          Align(
            alignment: Alignment.center,
            child: FlatButton(
                onPressed: () => _loginSignupToggleBloc.togglecurrentTab(1),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Don't have account ?",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: " Sign Up",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold))
                ]))),
          ),
          Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "OR",
                  style: TextStyle(color: Colors.grey, fontSize: 30),
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 90,
                width: 90,
                child: FlatButton(
                    onPressed: null,
                    child: SvgPicture.asset('assets/images/google.svg')),
              ),
              Container(
                height: 90,
                width: 90,
                child: FlatButton(
                    onPressed: null,
                    child: SvgPicture.asset('assets/images/facebook.svg')),
              ),
              Container(
                height: 90,
                width: 90,
                child: FlatButton(
                    onPressed: null,
                    child: SvgPicture.asset('assets/images/twitter.svg')),
              ),
            ],
          )
        ],
      ),
    );
  }
}
