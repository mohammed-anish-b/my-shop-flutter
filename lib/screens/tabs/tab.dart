import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/api/models/Product.dart';
import 'package:my_shop/blocs/product-search-bloc.dart';
import 'package:provider/provider.dart';
import 'package:my_shop/blocs/tab-switch-bloc.dart';
import 'package:my_shop/api/services/product-service.dart';

class CustomTab extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    final _tabSwitchBloc = Provider.of<TabSwitchBloc>(context);
    final _productService = Provider.of<ProductService>(context);
    FirebaseUser user = Provider.of<FirebaseUser>(context);
    String query  = Provider.of<ProductSearchBloc>(context).query;

    return  StreamProvider<List<Product>>.value(value: _productService.getProduct(query,user) ,child: _tabSwitchBloc.tab);
    
  }
}