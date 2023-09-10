import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp/network/repo.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {

  final Repository repository = Repository();
  
    on<ProfileEvent>((event, emit) async {
      
      if(event is GetProfile){
        emit(GetProfileLoading());

        try {

          final response = await repository.getProfile(event.token);
          print(event.token);
          print(response);
          emit(GetProfileSuccess(response));

        } on TimeoutException {
          emit(GetProfileFailed("Request Time Out"));
        } catch (e) {
          emit(GetProfileFailed(e.toString()));
        }
      }
      
      if(event is CreateProfile){
        emit(CreateProfileLoading());

        try {

          final response = await repository.createProfile(event.token, event.name, event.birthday, event.height, event.weight, event.interests);
          emit(CreateProfileSuccess(response));

        } on TimeoutException {
          emit(CreateProfileFailed("Request Time Out"));
        } catch (e) {
          emit(CreateProfileFailed(e.toString()));
        }
      }
      
      if(event is UpdateProfile){
        emit(UpdateProfileLoading());

        try {

          final response = await repository.updateProfile(event.token, event.name, event.birthday, event.height, event.weight, event.interests);
          emit(UpdateProfileSuccess(response));

        } on TimeoutException {
          emit(UpdateProfileFailed("Request Time Out"));
        } catch (e) {
          emit(UpdateProfileFailed(e.toString()));
        }
      }

    });
  }
}