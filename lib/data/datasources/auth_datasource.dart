import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:recog_plantify/data/models/login_response.dart';

abstract class AuthDataSource {
  Future<LoginResponse> login(String userName, String password);
  Future<bool> register(String username, String email, String password,
      String firstname, String lastname);
}

class AuthDataSourceImpl extends AuthDataSource {
  @override
  Future<LoginResponse> login(String userName, String password) async {
    const String url = "https://plantify.up.railway.app/api/users/login";
    Map<String, dynamic> data = {
      'username': userName,
      'password': password,
    };

    final http.Response response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: jsonEncode(data));
    if (response.statusCode == 200) {
      debugPrint("Hasta aquí todo bien");
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else {
      debugPrint(response.body);
      debugPrint(response.statusCode.toString());
      throw Exception("Error al iniciar sesión");
    }
  }

  @override
  Future<bool> register(String username, String email, String password,
      String firstname, String lastname) async {
    const String url = "https://plantify.up.railway.app/api/users/register";
    Map<String, dynamic> data = {
      "username": username,
      "email": email,
      "password": password,
      "firstName": firstname,
      "lastName": lastname,
    };

    final http.Response response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: jsonEncode(data));
    debugPrint(">>>>>> Register status code: ${response.statusCode}");
    if (response.statusCode == 200) {
      return true;
    } else {
      debugPrint(response.body);
      debugPrint(response.statusCode.toString());
      return true;
    }
  }
}
