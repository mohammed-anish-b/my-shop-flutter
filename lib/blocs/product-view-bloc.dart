import 'package:flutter/material.dart';

enum ViewType {
    LISTVIEW,GRIDVIEW
}

class ProductViewBloc extends ChangeNotifier {

  ViewType _viewType = ViewType.LISTVIEW;

  ViewType get viewType => _viewType;

  set viewType(ViewType viewType) {
    _viewType = viewType;
    notifyListeners();
  }

}