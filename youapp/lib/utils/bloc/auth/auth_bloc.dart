import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:youapp/network/repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {

  final Repository repository = Repository();

    on<AuthEvent>((event, emit) async {

      if(event is AuthChecking){
        emit(AuthLoading());

        try {

          final box = GetStorage();
          String token = box.read('token') ?? '';

          if(token.isEmpty){
            emit(AuthUnauthenticated());
          }else{
            emit(AuthAuthenticated(token));
          }

        } on TimeoutException {
            emit(AuthUnauthenticated());
        } catch (e) {
            emit(AuthUnauthenticated());
        }
      }

      if(event is Register){
        emit(RegisterLoading());

        try {

          final response = await repository.register(event.email, event.username, event.password);
          emit(RegisterSuccess(response));

        } on TimeoutException {
          emit(RegisterFailed("Request Time Out"));
        } catch (e) {
          emit(RegisterFailed(e.toString()));
        }
      }

      if(event is Login){
        emit(LoginLoading());

        try {

          final response = await repository.login(event.email, event.username, event.password);
          final box = GetStorage();
          await box.write('token', response.accessToken.toString());
          emit(LoginSuccess(response));

        } on TimeoutException {
          emit(LoginFailed("Request Time Out"));
        } catch (e) {
          emit(LoginFailed(e.toString()));
        }
      }

      if(event is Logout){
        emit(LoginLoading());

        try {

          final box = GetStorage();
          await box.remove('token');

          emit(LogoutSuccess());

        } on TimeoutException {
          emit(LogoutFailed());
        } catch (e) {
          emit(LogoutFailed());
        }
      }

    });
  }
}