import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_shop/api/models/Product.dart';
import 'package:my_shop/api/services/product-service.dart';
import 'package:my_shop/blocs/create-product-bloc.dart';
import 'package:my_shop/blocs/image-picker-bloc.dart';
import 'package:my_shop/blocs/loading-bloc.dart';
import 'package:my_shop/screens/product/create-product-button.dart';
import 'package:my_shop/screens/product/create-product-content.dart';
import 'package:my_shop/services/firestorage-service.dart';
import 'package:my_shop/utils/loading.dart';
import 'package:provider/provider.dart';

class CreateProduct extends StatefulWidget {
  @override
  _CreateProductState createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  File _image;
  bool isLoading = false;
  Product _product = Product();

  FireStorageService _storageService = FireStorageService.getInstance;
  ProductService _productService = ProductService.getInstance;

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
          bottomNavigationBar: ChangeNotifierProvider<LoadingBloc>(create: (context) => LoadingBloc(), child: CreateProductButton())),
    );
  }

  Future getImage(ImageSource source) async {
    var image = await ImagePicker.pickImage(source: source);
    if (image != null) {
      File cropped = await ImageCropper.cropImage(sourcePath: image.path);
      setState(() {
        _image = cropped;
      });
    }
  }
}
