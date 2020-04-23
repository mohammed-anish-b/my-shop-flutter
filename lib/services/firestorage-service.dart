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
  void startUpload(File file) async {
    _task = _storage.ref().child("images${DateTime.now()}").putFile(file);
    String url = await (await _task.onComplete).ref.getDownloadURL();
    this.url = url;
  }
}
