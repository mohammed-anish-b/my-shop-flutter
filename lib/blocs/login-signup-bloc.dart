import 'package:flutter/cupertino.dart';

class LoginSignupBloc extends ChangeNotifier{

  String _email;
  String _password;
  String _repeat;
  bool _agree = false;

  get email => _email;

  get password => _password;

  get repeat => _repeat;

  get agree => _agree;

  set email(email){
    _email = email;
    notifyListeners();
  }

  set password(password) {
    _password = password;
    notifyListeners();
  }

  set repeat(repeat) {
    _repeat = repeat;
  }

  set agree(agree) {
     _agree = agree;
    notifyListeners();
  }

}