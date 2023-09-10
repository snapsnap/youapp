part of 'auth_bloc.dart';


abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthAuthenticated extends AuthState {
  final dynamic user;
  AuthAuthenticated(this.user);
}

class AuthUnauthenticated extends AuthState {}

class AuthLoading extends AuthState {}

class NoConnectivity extends AuthState {
  final String message;

  NoConnectivity(this.message);
}

// Register State
// ==============================
class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {
  final dynamic data;
  RegisterSuccess(this.data);
}

class RegisterFailed extends AuthState {
  final String? message;
  RegisterFailed(this.message);
}

// Login State
// ==============================
class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final dynamic data;
  LoginSuccess(this.data);
}

class LoginFailed extends AuthState {
  final String? message;
  LoginFailed(this.message);
}

// Logout State
// ==============================
class LogoutLoading extends AuthState {}

class LogoutSuccess extends AuthState {}

class LogoutFailed extends AuthState {}