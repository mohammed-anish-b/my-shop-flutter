import 'package:flutter/cupertino.dart';
import 'package:my_shop/screens/authenticate/login.dart';
import 'package:my_shop/screens/authenticate/signup.dart';

class LoginSignupToggleBloc extends ChangeNotifier {
  Widget _currentTab = Login();

  Widget get currentTab => _currentTab;

  togglecurrentTab(int index) {
    if(index == 0) {
      _currentTab = Login();
    } else {
      _currentTab = SignUp();
    }
    notifyListeners();
  }
}