import 'package:flutter/cupertino.dart';

class ProductSearchBloc extends ChangeNotifier{
  String query = '';

  updateQuery(query) {
    this.query = query;
    notifyListeners();
  }
}