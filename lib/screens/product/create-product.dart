import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/api/services/product-service.dart';
import 'package:my_shop/blocs/create-product-bloc.dart';
import 'package:my_shop/blocs/image-picker-bloc.dart';
import 'package:my_shop/blocs/loading-bloc.dart';
import 'package:my_shop/screens/product/create-product-button.dart';
import 'package:my_shop/screens/product/create-product-content.dart';
import 'package:my_shop/services/firestorage-service.dart';
import 'package:provider/provider.dart';

class CreateProduct extends StatefulWidget {
  @override
  _CreateProductState createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ImagePickerBloc>.value(value: ImagePickerBloc()),
        Provider(create: (context) => CreateProductBloc()),
        Provider(create: (context) => FireStorageService()),
        Provider(create: (context) => ProductService())
      ],
      child: Scaffold(
          backgroundColor: Colors.blue,
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 150.0,
                flexibleSpace: const FlexibleSpaceBar(
                  title: Text('Create Product'),
                ),
                floating: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[CreateProductContent()],
                ),
              ),
            ],
          ),
          bottomNavigationBar: ChangeNotifierProvider<LoadingBloc>(
              create: (context) => LoadingBloc(),
              child: CreateProductButton())),
    );
  }
}
