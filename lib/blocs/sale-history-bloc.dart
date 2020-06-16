import 'package:flutter/cupertino.dart';

class SaleHistoryBloc extends ChangeNotifier{

  DateTime date = DateTime.now();

  changeDate(DateTime date) {
    this.date = date;
    notifyListeners();
  }
  
}