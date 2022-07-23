// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class Processing extends AuthState {}

class LoggedIn extends AuthState {}

class VerificationEmailSend extends AuthState {}

class ResetPasswdEmailSend extends AuthState {}

class Error extends AuthState {
  final String error;
  Error({
    required this.error,
  });
}