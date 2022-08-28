// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class UploadingProfileImg extends ProfileState {}

class ProfileImgUploaded extends ProfileState {
  final String? downloadUrl;
  ProfileImgUploaded({
    this.downloadUrl,
  });
}

class ProfileError extends ProfileState {
  final String error;
  ProfileError({
    required this.error,
  });
}
