import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class CreditsDataSource {
  Future<Unit> decreaseCredits(String token, int credits);
}

class CreditsDataSourceImpl extends CreditsDataSource {
  CreditsDataSourceImpl();

  final baseURL = "http://localhost:3030/api/";

  @override
  Future<Unit> decreaseCredits(String token, int credits) async {
    String url = "${baseURL}credits/decrease";
    
    Map<String, dynamic> body = {
      "amount": credits,
    };

    var response = await http.patch(Uri.parse(url), body: body);
    if (jsonDecode(response.body)["ok"]) {
      return unit;
    } else {
      throw Exception("Error al disminuir los créditos");
    }
  }
}
