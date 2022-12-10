import 'dart:convert';

import 'package:recog_plantify/data/models/response/request_api_key_response.dart';
import 'package:recog_plantify/data/models/response/send_email_response.dart';
import 'package:http/http.dart' as http;

abstract class ApiKeyDataSource {
  Future<SendEmailResponse> sendEmail(String token);
  Future<RequestApiKeyResponse> requestApiKey(String token);
}

class ApiKeyDataSourceImpl extends ApiKeyDataSource {
  final String baseURL = "http://192.168.3.9:3030/api/";

  @override
  Future<SendEmailResponse> sendEmail(String token) async {
    final String url = "${baseURL}key/generate";
    // Create variable with header with token
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer $token",
    };
    var response = await http.get(Uri.parse(url), headers: headers);
    return SendEmailResponse.fromJson(jsonDecode(response.body));
  }

  @override
  Future<RequestApiKeyResponse> requestApiKey(String token) async {
    final String url = "${baseURL}key/request";
    // Create variable with header with token
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "Bearer $token",
    };
    var response = await http.get(Uri.parse(url), headers: headers);
    return RequestApiKeyResponse.fromJson(jsonDecode(response.body));
  }
}
