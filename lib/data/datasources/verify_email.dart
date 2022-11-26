import 'dart:convert';

import 'package:recog_plantify/data/models/verify_email_response.dart';
import 'package:http/http.dart' as http;

abstract class SendEmailDataSource {
  Future<SendEmailResponse> sendEmail(String token);
}

class SendEmailDataSourceImpl extends SendEmailDataSource{
  @override
  Future<SendEmailResponse> sendEmail(String token) async {
    const String url = "http://localhost:3030/api/key/request";
    // Create variable with header with token
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer $token",
    };
    var response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode != 200) {
      throw Exception("Error al conectarse con el servidor");
    }

    if (!jsonDecode(response.body)["ok"]) {
      throw Exception("Error al verificar el correo");
    }

    return SendEmailResponse.fromJson(jsonDecode(response.body));
  }
}
