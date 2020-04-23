import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_shop/blocs/current-tab-bloc.dart';
import 'package:my_shop/screens/home/cutom-bottom-navigater.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TabSwitchBloc(),
        child: Scaffold(
          backgroundColor: Colors.blue,
          bottomNavigationBar: CustomBottomNavigater(),
          floatingActionButton: FloatingActionButton(
            tooltip: "Add Product",
            onPressed: () {
              Navigator.pushNamed(context, "create-product");
            },
            child: Icon(Icons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: BlocBuilder<TabSwitchBloc, Widget>(
              builder: (BuildContext context, Widget widget) {
            return widget;
          }),
        ));
  }
}