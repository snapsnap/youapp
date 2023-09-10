part of 'auth_bloc.dart';


abstract class AuthEvent {}

class AuthChecking extends AuthEvent {}

class AuthLoggedIn extends AuthEvent {
  final dynamic data;
  AuthLoggedIn(this.data);
}

class Logout extends AuthEvent {}

class NoConnectivityEvent extends AuthEvent {}

class Register extends AuthEvent {
  final String email;
  final String username;
  final String password;
  Register(this.email, this.username, this.password);
}

class Login extends AuthEvent {
  final String email;
  final String username;
  final String password;
  Login(this.email, this.username, this.password);
}
