import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_shop/blocs/tab-switch-bloc.dart';

class CustomTab extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    final _tabSwitchBloc = Provider.of<TabSwitchBloc>(context);
    return _tabSwitchBloc.tab;
    
  }
}