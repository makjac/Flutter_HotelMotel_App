part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class Processing extends AuthState {}

class LoggedIn extends AuthState {}

class Authorized extends AuthState {}

class VerificationEmailSend extends AuthState {}

class ResetPasswdEmailSend extends AuthState {}

class AuthError extends AuthState {
  final String error;

  AuthError({
    required this.error,
  });
}

class SignedOut extends AuthState {}
