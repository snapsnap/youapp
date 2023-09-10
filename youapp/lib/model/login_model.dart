class LoginModel {
  String? message;
  String? accessToken;

  LoginModel({this.message, this.accessToken});

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['access_token'] = accessToken;
    return data;
  }
}
