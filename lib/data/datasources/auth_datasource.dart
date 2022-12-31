import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:recog_plantify/core/constants/server.dart';
import 'package:recog_plantify/core/utils/failure.dart';
import 'package:recog_plantify/data/models/response/login_response.dart';
import 'package:recog_plantify/data/models/response/register_response.dart';

abstract class AuthDataSource {
  Future<LoginResponse> login(String userName, String password);
  Future<RegisterResponse> register(String username, String email,
      String password, String firstname, String lastname);
}

class AuthDataSourceImpl extends AuthDataSource {
  final String baseURL = Server.base;
  @override
  Future<LoginResponse> login(String userName, String password) async {
    // const String url = "http://plantify.up.railway.app/api/users/login";
    final String url = "${baseURL}users/login";
    Map<String, dynamic> data = {
      'username': userName,
      'password': password,
    };

    final http.Response response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: jsonEncode(data));

    print(jsonDecode(response.body)["ok"]);
    return LoginResponse.fromJson(jsonDecode(response.body));
  }

  @override
  Future<RegisterResponse> register(String username, String email,
      String password, String firstname, String lastname) async {
    final String url = "${baseURL}users/register";
    Map<String, dynamic> data = {
      "username": username,
      "email": email,
      "password": password,
      "firstName": firstname,
      "lastName": lastname,
    };

    final response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: jsonEncode(data));
    debugPrint(">>>>>> Register status code: ${response.statusCode}");
    return RegisterResponse.fromJson(jsonDecode(response.body));
  }
}
