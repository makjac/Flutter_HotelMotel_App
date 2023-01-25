// ignore_for_file: depend_on_referenced_packages
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hotel_motel/controller/user/user_controller.dart';
import 'package:hotel_motel/locator.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserController _userController = locator.get<UserController>();

  AuthBloc() : super(AuthInitial()) {
    on<SignInRequest>(_signIn);
    on<SignUpRequest>(_signUp);
    on<ForgotPasswdRequest>(_forgotPasswd);
    on<SignOutRequest>(_signOut);
    on<CheckUserEvt>(_checkUser);
  }

  FutureOr<void> _signIn(SignInRequest event, Emitter<AuthState> emit) async {
    try {
      emit(Processing());

      await _userController.signInUser(
          email: event.email, passwd: event.passwd);
      await _userController.initUser();
      emit(LoggedIn());
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  FutureOr<void> _signUp(SignUpRequest event, Emitter<AuthState> emit) async {
    try {
      emit(Processing());
      await _userController.signUpUser(
          email: event.email, passwd: event.passwd);
      emit(Authorized());
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  FutureOr<void> _forgotPasswd(
      ForgotPasswdRequest event, Emitter<AuthState> emit) async {
    try {
      emit(Processing());
      await _userController.resetUserPassword(email: event.email);
      emit(ResetPasswdEmailSend());
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  FutureOr<void> _signOut(SignOutRequest event, Emitter<AuthState> emit) async {
    try {
      emit(Processing());
      await _userController.logoutUser();
      emit(SignedOut());
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  FutureOr<void> _checkUser(CheckUserEvt event, Emitter<AuthState> emit) async {
    try {
      emit(CheckingUser());
      if (await _userController.isUserLoggedIn()) {
        emit(UserLoggedIn());
      } else {
        emit(NoUserLoggedIn());
      }
    } catch (e) {
      emit(AuthError(error: "No loggedin user..."));
    }
  }
}
