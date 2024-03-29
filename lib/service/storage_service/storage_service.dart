import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:hotel_motel/service/storage_service/base_storage_service.dart';

class StorageService extends BaseStorageService {
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

  Future<String> getProfUlrImgUrl(String? uid) async {
    try {
      var storageRef = _storage.ref().child("$profileImgLicatoion$uid");
      return storageRef.getDownloadURL();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> deleteProfulrImgUrl(String? uid) async {
    try {
      var storageRef = _storage.ref().child("$profileImgLicatoion$uid");
      await storageRef.delete();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> getFileDownloadUrl(String fileName, String? path) async {
    try {
      var storageRef = _storage.ref().child("$path$fileName");
      return storageRef.getDownloadURL();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> uploadFile(File file, String fileName, [String? path]) async {
    try {
      var storageRef = _storage.ref().child("$path$fileName");
      await storageRef.putFile(file);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> deleteFile(String fileName, [String? path]) async {
    try {
      var storageRef = _storage.ref().child("$path$fileName");
      await storageRef.delete();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
