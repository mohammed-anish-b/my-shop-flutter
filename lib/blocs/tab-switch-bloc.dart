import 'package:flutter/material.dart';
import 'package:my_shop/screens/tabs/cart.dart';
import 'package:my_shop/screens/tabs/store.dart';

class TabSwitchBloc  extends ChangeNotifier{
  Widget _currentWidget = Store();
  int _index = 0;

  Widget get tab => _currentWidget;

  int get index => _index;

  set tab(Widget val) {
    _currentWidget = val;
    notifyListeners();
  }

  switchTab(int val) {
    _index = val;

    if(val == 1) {
      tab = Cart();
    } else if( val == 0) {
      tab = Store();
    }
  }

}