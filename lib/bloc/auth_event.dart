// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SignInRequest extends AuthEvent {
  final String email;
  final String passwd;

  SignInRequest({
    required this.email,
    required this.passwd,
  });
}

class GoogleSignInRequest extends AuthEvent {}

class SignUpRequest extends AuthEvent {
  final String email;
  final String passwd;
  SignUpRequest({
    required this.email,
    required this.passwd,
  });
}

class SignOutRequest extends AuthEvent {}

class ForgotPasswdRequest extends AuthEvent {
  final String email;
  ForgotPasswdRequest({
    required this.email,
  });
}
