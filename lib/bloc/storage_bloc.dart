import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hotel_motel/data/controller/user_controller.dart';
import 'package:hotel_motel/locator.dart';

part 'storage_event.dart';
part 'storage_state.dart';

class StorageBloc extends Bloc<StorageEvent, StorageState> {
  final UserController _userController = locator.get<UserController>();

  StorageBloc() : super(StorageInitial()) {
    on<UploadProfileImage>(_uploadProfileImg);
  }

  FutureOr<void> _uploadProfileImg(
      UploadProfileImage event, Emitter<StorageState> emit) async {
    try {
      emit(UploadingFile());
      _userController.uploadUserProfileImage(event.image);
      emit(FlieUploaded());
    } catch (e) {
      emit(StorageError(error: e.toString()));
    }
  }
}
