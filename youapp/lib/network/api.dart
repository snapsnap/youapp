import 'dart:convert';
import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:youapp/network/custom_exception.dart';

import '../../common/variable.dart';

class Api {

  Future register(String url, String? email, String? username, String? password) async {
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;

    try {
      final response = await http
          .post(
            Uri.parse(baseURL + url),
            headers: {"Content-type": "application/json; charset=UTF-8"},
            body: jsonEncode({
              "email": email,
              "username": username,
              "password": password,
            }),
          )
          .timeout(const Duration(seconds: timeOutRequest));

      responseJson = customResponseStatus(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  Future login(String url, String? email, String? username, String? password) async {
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;

    try {
      final response = await http
          .post(
            Uri.parse(baseURL + url),
            headers: {"Content-type": "application/json; charset=UTF-8"},
            body: jsonEncode({
              "email": email,
              "username": username,
              "password": password,
            }),
          )
          .timeout(const Duration(seconds: timeOutRequest));

      responseJson = customResponseStatus(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  Future getProfile(String url, String token) async {
    print(token);
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;

    try {
      final response = await http.get(
        Uri.parse(baseURL + url), 
        headers: {
          "Content-type": "application/json; charset=UTF-8",
          "x-access-token:": token
        }).timeout(const Duration(seconds: timeOutRequest));
      responseJson = customResponseStatus(response);
      print(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  Future createProfile(String url, String token, String name, String birthday, String height, String weight, List interests) async {
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;

    try {
      final response = await http
          .post(
            Uri.parse(baseURL + url),
            headers: {
              "Content-type": "application/json; charset=UTF-8",
              "x-access-token:": token
            },
            body: jsonEncode({
              "name": name,
              "birthday": birthday,
              "height": height,
              "weight": weight,
              "interests": interests,
            }),
          )
          .timeout(const Duration(seconds: timeOutRequest));

      responseJson = customResponseStatus(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  Future updateProfile(String url, String token, String name, String birthday, String height, String weight, List interests) async {
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;

    try {
      final response = await http
          .put(
            Uri.parse(baseURL + url),
            headers: {
              "Content-type": "application/json; charset=UTF-8",
              "x-access-token:": token
            },
            body: jsonEncode({
              "name": name,
              "birthday": birthday,
              "height": height,
              "weight": weight,
              "interests": interests,
            }),
          )
          .timeout(const Duration(seconds: timeOutRequest));

      responseJson = customResponseStatus(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

}
