import 'package:flutter/cupertino.dart';

class LoadingBloc extends ChangeNotifier {

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  toggleLoading() {
    this._isLoading = !this._isLoading;
    notifyListeners();
  }
}