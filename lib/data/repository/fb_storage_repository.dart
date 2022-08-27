import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:hotel_motel/data/models/user_model.dart';
import 'package:hotel_motel/data/repository/fb_auth_repository.dart';
import 'package:hotel_motel/locator.dart';

class StorageRepository {
  final String profileImgLicatoion = "user/profile/";
  final FirebaseStorage _storage =
      FirebaseStorage.instanceFor(bucket: "gs://hotelmotel-66527.appspot.com");

  Future<void> uploadProfileFile(File file, String uid) async {
    try {
      var storageRef = _storage.ref().child("$profileImgLicatoion$uid");
      await storageRef.putFile(file);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> getProfulrImgUrl(String uid) async {
    try {
      var storageRef = _storage.ref().child("$profileImgLicatoion$uid");
      return storageRef.getDownloadURL().toString();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
