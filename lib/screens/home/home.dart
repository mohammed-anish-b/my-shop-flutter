import 'package:flutter/material.dart';
import 'package:my_shop/api/services/checkout-service.dart';
import 'package:my_shop/api/services/product-service.dart';
import 'package:my_shop/api/services/sale-history-service.dart';
import 'package:my_shop/blocs/cart-bloc.dart';
import 'package:my_shop/blocs/product-search-bloc.dart';
import 'package:my_shop/blocs/product-view-bloc.dart';
import 'package:my_shop/blocs/tab-switch-bloc.dart';
import 'package:my_shop/screens/home/bottom-action-button.dart';
import 'package:my_shop/screens/home/cutom-bottom-navigater.dart';
import 'package:my_shop/screens/tabs/tab.dart';
import 'package:my_shop/shared/sidemenu.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<TabSwitchBloc>.value(value: TabSwitchBloc()),
          Provider(create: (context) => ProductService()),
          ChangeNotifierProvider.value(value: ProductViewBloc()),
          ChangeNotifierProvider.value(value: CartBloc()),
          ChangeNotifierProvider.value(value: ProductSearchBloc()),
          Provider(create: (context) => CheckoutService()),
          Provider(create: (context) => SaleHistoryService()),
        ],
        child: Scaffold(
          drawer: SideMenu(),
          backgroundColor: Colors.white,
          bottomNavigationBar: CustomBottomNavigater(),
          floatingActionButton: BottomActionButon(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: CustomTab(),
        ));
  }
}
