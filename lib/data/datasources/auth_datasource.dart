import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:recog_plantify/data/models/user_model.dart';

abstract class AuthDataSource {
  Future<UserModel> login(String userName, String password);
}

class AuthDataSourceImpl extends AuthDataSource {
  @override
  Future<UserModel> login(String userName, String password) async {
    const String url = "https://plantify.up.railway.app/api/users/login";
    Map<String, dynamic> data = {
      'username': userName,
      'password': password,
    };

    final http.Response response = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: jsonEncode(data));
    if (response.statusCode == 200) {
      print("Hasta aquí todo bien");
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      debugPrint(response.body);
      debugPrint(response.statusCode.toString());
      throw Exception("Error al iniciar sesión");
    }
  }
}
