// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'storage_bloc.dart';

@immutable
abstract class StorageEvent {}

class UploadProfileImage extends StorageEvent {
  final File image;
  UploadProfileImage({
    required this.image,
  });
}
