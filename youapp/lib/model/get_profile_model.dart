class GetProfileModel {
  GetProfileModel({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data data;
  
  GetProfileModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final res = <String, dynamic>{};
    res['message'] = message;
    res['data'] = data.toJson();
    return res;
  }
}

class Data {
  Data({
    required this.email,
    required this.username,
    required this.interests,
  });
  late final String email;
  late final String username;
  late final List<dynamic> interests;
  
  Data.fromJson(Map<String, dynamic> json){
    email = json['email'];
    username = json['username'];
    interests = List.castFrom<dynamic, dynamic>(json['interests']);
  }

  Map<String, dynamic> toJson() {
    final res = <String, dynamic>{};
    res['email'] = email;
    res['username'] = username;
    res['interests'] = interests;
    return res;
  }
}