part of 'profile_bloc.dart';


abstract class ProfileEvent {}

class ProfileLoggedOut extends ProfileEvent {}

class GetProfile extends ProfileEvent {
  final String token;
  GetProfile(this.token);
}

class CreateProfile extends ProfileEvent {
  final String token;
  final String name;
  final String birthday;
  final String height;
  final String weight;
  final List interests;
  CreateProfile(this.token, this.name, this.birthday, this.height, this.weight, this.interests);
}

class UpdateProfile extends ProfileEvent {
  final String token;
  final String name;
  final String birthday;
  final String height;
  final String weight;
  final List interests;
  UpdateProfile(this.token, this.name, this.birthday, this.height, this.weight, this.interests);
}
