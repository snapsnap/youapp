import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';

dynamic customResponseStatus(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      // print(responseJson);
      return responseJson;
    case 201:
      var responseJson = json.decode(response.body.toString());
      // print(responseJson);
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString(), 400);
    case 401:
      throw BadRequestException(response.body.toString(), 401);
    case 404:
      throw BadRequestException(response.body.toString(), 404);
    case 403:
      throw UnauthorisedException(response.body.toString(), 403);
    case 500:
      throw InternalErrorException(response.body.toString(), 500);
    default:
      throw FetchDataException();
  }
}

class CustomException implements Exception {
  // ignore: prefer_typing_uninitialized_variables
  final _message;
  // ignore: prefer_typing_uninitialized_variables
  final _prefix;
  // ignore: prefer_typing_uninitialized_variables
  final _statusCode;

  CustomException([this._message, this._prefix, this._statusCode]);

  @override
  String toString() {
    if (kDebugMode) {
      print("Error Custome exception {$_prefix $_statusCode $_message}");
    }
    return "$_prefix";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message]) : super(message, "Tidak ada koneksi internet");
}

class BadRequestException extends CustomException {
  BadRequestException([message, int? statusCode]) : super(message, "Invalid Request: ", statusCode);
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message, int? statusCode]) : super(message, "Unauthorised: ", statusCode);
}

class InvalidInputException extends CustomException {
  InvalidInputException([String? message, int? statusCode]) : super(message, "Invalid Input: ", statusCode);
}

class InternalErrorException extends CustomException {
  InternalErrorException([String? message, int? statusCode]) : super(message, "Internal Server Error: ", statusCode);
}
