import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends ChangeNotifier {
  File _image;

  File get image => _image;

  Future setImage(ImageSource source) async {
    await ImagePicker.pickImage(source: source).then((image) async {
      if (image != null) {
        await ImageCropper.cropImage(sourcePath: image.path).then((crop) {
          this._image = crop;
          notifyListeners();
        });
      }
    });
  }
}
