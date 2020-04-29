import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_shop/api/services/product-service.dart';
import 'package:my_shop/blocs/loading-bloc.dart';
import 'package:my_shop/utils/loading.dart';
import 'package:provider/provider.dart';
import 'package:my_shop/services/firestorage-service.dart';
import 'package:my_shop/blocs/image-picker-bloc.dart';
import 'package:my_shop/blocs/create-product-bloc.dart';

class CreateProductButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _storageService = Provider.of<FireStorageService>(context);
    final _imagePickerBloc = Provider.of<ImagePickerBloc>(context);
    final _createProductBloc = Provider.of<CreateProductBloc>(context);
    final _productService = Provider.of<ProductService>(context);
    final _loadingBloc = Provider.of<LoadingBloc>(context);

    return _loadingBloc.isLoading == true
        ? Loading(
            color: Colors.white,
          )
        : FlatButton.icon(
            onPressed: () async {
              _loadingBloc.toggleLoading();
              await _storageService
                  .startUpload(_imagePickerBloc.image)
                  .then((url) {
                _createProductBloc.imageUrl = url;
                _productService
                    .createProduct(_createProductBloc.product)
                    .then((val) {
                  _loadingBloc.toggleLoading();
                  Navigator.pop(context);
                });
              });
            },
            icon: Icon(
              Icons.fastfood,
              color: Colors.white,
            ),
            label: Text(
              "CREATE",
              style: TextStyle(color: Colors.white),
            ));
  }
}

