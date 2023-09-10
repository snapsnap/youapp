
import 'package:youapp/model/get_profile_model.dart';
import 'package:youapp/model/login_model.dart';
import 'package:youapp/model/register_model.dart';
import 'package:youapp/network/api.dart';

class Repository {
  final Api _api = Api();

  Future register(String? email, String? username, String? password) async {
    final response = await _api.register('/api/register', email, username, password);
    return RegisterModel.fromJson(response);
  }

  Future login(String? email, String? username, String? password) async {
    final response = await _api.login('/api/login', email, username, password);
    return LoginModel.fromJson(response);
  }

  Future getProfile(String token) async {
    final response = await _api.getProfile('/api/getProfile', token);
    return GetProfileModel.fromJson(response);
  }

  Future createProfile(String token, String name, String birthday, String height, String weight, List interests) async {
    final response = await _api.createProfile('/api/createProfile', token, name, birthday, height, weight, interests);
    return GetProfileModel.fromJson(response);
  }

  Future updateProfile(String token, String name, String birthday, String height, String weight, List interests) async {
    final response = await _api.updateProfile('/api/updateProfile', token, name, birthday, height, weight, interests);
    return GetProfileModel.fromJson(response);
  }

}
