import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageRepository {
  final String profileImgLicatoion = "user/profile/";
  final FirebaseStorage _storage =
      FirebaseStorage.instanceFor(bucket: "gs://hotelmotel-66527.appspot.com");

  Future<void> uploadProfileFile(File file, String? uid) async {
    try {
      var storageRef = _storage.ref().child("$profileImgLicatoion$uid");
      await storageRef.putFile(file);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> getProfulrImgUrl(String? uid) async {
    try {
      var storageRef = _storage.ref().child("$profileImgLicatoion$uid");
      return storageRef.getDownloadURL();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
