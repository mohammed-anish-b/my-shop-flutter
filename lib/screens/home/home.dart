import 'package:flutter/material.dart';
import 'package:my_shop/api/services/product-service.dart';
import 'package:my_shop/blocs/product-view-bloc.dart';
import 'package:my_shop/blocs/tab-switch-bloc.dart';
import 'package:my_shop/screens/home/cutom-bottom-navigater.dart';
import 'package:my_shop/screens/tabs/tab.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<TabSwitchBloc>.value(value: TabSwitchBloc()),
          Provider(create: (context) => ProductService()),
          ChangeNotifierProvider.value(value: ProductViewBloc())
        ],
        child: Scaffold(
          backgroundColor: Colors.white,
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
          body: CustomTab(),
        ));
  }
}


