// ignore_for_file: depend_on_referenced_packages
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:hotel_motel/data/repository/auth_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc({required this.repository}) : super(AuthInitial()) {
    on<SignInRequest>(_signIn);
    on<SignUpRequest>(_signUp);
  }

  FutureOr<void> _signIn(SignInRequest event, Emitter<AuthState> emit) async {
    try {
      emit(Processing());

      await repository.signIn(email: event.email, passwd: event.passwd);
      emit(LoggedIn());
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  FutureOr<void> _signUp(SignUpRequest event, Emitter<AuthState> emit) async {
    try {
      emit(Processing());
      await repository.signUp(email: event.email, passwd: event.passwd);
      emit(Authorized());
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }
}
