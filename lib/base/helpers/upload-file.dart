import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

Future<String> uploadFile(XFile xfile) async {
  final storageRef = FirebaseStorage.instance.ref();
  final imageRef = storageRef.child('media/${xfile.name}');
  var file = File(xfile.path);
  await imageRef.putFile(file, SettableMetadata(contentType: xfile.mimeType));
  final downloadURL = await imageRef.getDownloadURL();
  return downloadURL;
}
