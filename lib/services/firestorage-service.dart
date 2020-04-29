import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FireStorageService {
  static FireStorageService _instance;

  static FireStorageService get getInstance {
    if (_instance == null) {
      _instance = FireStorageService();
    }
    return _instance;
  }

  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://my-shop-flutter-mg.appspot.com');

  StorageUploadTask _task;
  String url;

  Future<String> startUpload(File file) async {
    if (file != null) {
      _task = _storage.ref().child("images${DateTime.now()}").putFile(file);
      String url = await (await _task.onComplete).ref.getDownloadURL();
      return url;
    } else {
      return null;
    }
  }
}
