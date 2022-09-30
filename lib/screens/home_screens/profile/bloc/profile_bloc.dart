// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:hotel_motel/data/controller/user/user_controller.dart';
import 'package:hotel_motel/locator.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserController _userController = locator.get<UserController>();

  ProfileBloc() : super(ProfileInitial()) {
    on<UploadProdileImgEvt>(_uploadProfileImg);
  }

  FutureOr<void> _uploadProfileImg(
      UploadProdileImgEvt event, Emitter<ProfileState> emit) async {
    try {
      emit(UploadingProfileImg());
      await _userController.uploadUserProfileImage(event.image).then((value) {
        emit(ProfileImgUploaded(downloadUrl: value));
      });
    } catch (e) {
      emit(ProfileError(error: e.toString()));
    }
  }
}
