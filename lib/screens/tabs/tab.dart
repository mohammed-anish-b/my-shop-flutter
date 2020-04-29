import 'package:flutter/material.dart';
import 'package:my_shop/api/models/Product.dart';
import 'package:provider/provider.dart';
import 'package:my_shop/blocs/tab-switch-bloc.dart';
import 'package:my_shop/api/services/product-service.dart';

class CustomTab extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    final _tabSwitchBloc = Provider.of<TabSwitchBloc>(context);
    final _productService = Provider.of<ProductService>(context);

    return  StreamProvider<List<Product>>.value(value: _productService.products ,child: _tabSwitchBloc.tab);
    
  }
}