import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/screens/tabs/cart.dart';
import 'package:my_shop/screens/tabs/store.dart';

class TabSwitchEvent {
  final data;
  TabSwitchEvent({this.data});
}

class TabChangeEvent extends TabSwitchEvent {
  final data;
  TabChangeEvent({this.data});
}

class TabSwitchBloc extends Bloc<TabSwitchEvent, Widget> {
  @override
  Widget get initialState => Store();

  @override
  Stream<Widget> mapEventToState(TabSwitchEvent event) async* {
    if(event is TabSwitchEvent) {
      if(event.data == 0) {
        yield  Store();
      } else if(event.data == 1) {
        yield  Cart();
      }
    }
  }
}

