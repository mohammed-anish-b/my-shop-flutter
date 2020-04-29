import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_shop/api/models/Product.dart';
import 'package:my_shop/api/services/product-service.dart';
import 'package:my_shop/services/firestorage-service.dart';
import 'package:my_shop/utils/loading.dart';

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
    return Scaffold(
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
                <Widget>[
                  Container(
                    height: 500.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(40.0),
                            topRight: const Radius.circular(40.0))),
                    child: Form(
                        child: Padding(
                      padding: EdgeInsets.all(23),
                      child: ListView(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Center(
                                  child: _image == null
                                      ? Text('No image selected.')
                                      : ClipRRect(
                                          child: Image.file(
                                            _image,
                                            height: 170,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                ),
                              ),
                              FloatingActionButton(
                                heroTag: null,
                                onPressed: () {
                                  getImage(ImageSource.gallery);
                                },
                                tooltip: 'Pick Image',
                                child: Icon(Icons.photo_library),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FloatingActionButton(
                                heroTag: null,
                                onPressed: () {
                                  getImage(ImageSource.camera);
                                },
                                tooltip: 'Pick Image',
                                child: Icon(Icons.add_a_photo),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: "Name",
                                labelStyle: TextStyle(fontSize: 25)),
                            onChanged: (val) {
                              this._product.name = val;
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: "Price",
                                labelStyle: TextStyle(fontSize: 25)),
                            onChanged: (val) {
                              this._product.price = val;
                            },
                          )
                        ],
                      ),
                    )),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: isLoading
            ? Loading(color: Colors.white)
            : FlatButton.icon(
                onPressed: () async {
                  setState(() {
                    this.isLoading = true;
                  });
                  await _storageService.startUpload(_image);
                  this._product.imageUrl = _storageService.url;
                  _productService.createProduct(_product).then((val) {
                    this.isLoading = false;
                    Navigator.pop(context);
                  });
                },
                icon: Icon(
                  Icons.fastfood,
                  color: Colors.white,
                ),
                label: Text(
                  "CREATE",
                  style: TextStyle(color: Colors.white),
                )));
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
