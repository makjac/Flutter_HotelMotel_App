// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class UploadProdileImgEvt extends ProfileEvent {
  final File image;
  UploadProdileImgEvt({
    required this.image,
  });
}
