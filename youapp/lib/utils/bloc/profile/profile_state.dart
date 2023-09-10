part of 'profile_bloc.dart';


abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

// Get Profile State
// ==============================
class GetProfileLoading extends ProfileState {}

class GetProfileSuccess extends ProfileState {
  final dynamic data;
  GetProfileSuccess(this.data);
}

class GetProfileFailed extends ProfileState {
  final String? message;
  GetProfileFailed(this.message);
}

// Create Profile State
// ==============================
class CreateProfileLoading extends ProfileState {}

class CreateProfileSuccess extends ProfileState {
  final dynamic data;
  CreateProfileSuccess(this.data);
}

class CreateProfileFailed extends ProfileState {
  final String? message;
  CreateProfileFailed(this.message);
}

// Update Profile State
// ==============================
class UpdateProfileLoading extends ProfileState {}

class UpdateProfileSuccess extends ProfileState {
  final dynamic data;
  UpdateProfileSuccess(this.data);
}

class UpdateProfileFailed extends ProfileState {
  final String? message;
  UpdateProfileFailed(this.message);
}