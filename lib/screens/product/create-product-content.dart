import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:my_shop/blocs/image-picker-bloc.dart';
import 'package:my_shop/blocs/create-product-bloc.dart';

class CreateProductContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final _imagePickerBloc = Provider.of<ImagePickerBloc>(context);
    final _createProductBloc = Provider.of<CreateProductBloc>(context);
    FirebaseUser user = Provider.of<FirebaseUser>(context);
    _createProductBloc.userId = user.uid;
    
    return Container(
      height: MediaQuery.of(context).size.height,
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
                    child: _imagePickerBloc.image == null
                        ? Text('No image selected.')
                        : ClipRRect(
                            child: Image.file(
                              _imagePickerBloc.image,
                              height: 170,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () {
                    _imagePickerBloc.setImage(ImageSource.gallery);
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
                    _imagePickerBloc.setImage(ImageSource.camera);
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
                _createProductBloc.name = val;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: "Price",
                  labelStyle: TextStyle(fontSize: 25)),
              onChanged: (val) {
                _createProductBloc.price = val;
              },
            )
          ],
        ),
      )),
    );
  }
}
