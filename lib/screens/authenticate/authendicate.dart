import 'package:flutter/material.dart';
import 'package:my_shop/blocs/login-signup-toggle-bloc.dart';
import 'package:provider/provider.dart';

class Authendicate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final _loginSignupToggleBloc = Provider.of<LoginSignupToggleBloc>(context);
    return _loginSignupToggleBloc.currentTab;

  }
}
