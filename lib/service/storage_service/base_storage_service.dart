import 'dart:io';

abstract class BaseStorageService {
  Future<void> uploadProfileFile(File file, String? uid);

  Future<String> getProfUlrImgUrl(String? uid);

  Future<void> deleteProfulrImgUrl(String? uid);

  Future<String> getFileDownloadUrl(String fileName, String? path);

  Future<void> uploadFile(File file, String fileName, [String? path]);

  Future<void> deleteFile(String fileName, [String? path]);
}
