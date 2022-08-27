// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'storage_bloc.dart';

@immutable
abstract class StorageState {}

class StorageInitial extends StorageState {}

class UploadingFile extends StorageState {}

class FlieUploaded extends StorageState {}

class StorageError extends StorageState {
  final String error;
  StorageError({
    required this.error,
  });
}
