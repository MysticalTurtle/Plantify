import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) => RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) => json.encode(data.toJson());

class RegisterResponse {
    RegisterResponse({
        required this.ok,
        required this.message,
        required this.token,
    });

    final bool ok;
    final String message;
    final String token;

    factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
        ok: json["ok"],
        message: json["message"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "message": message,
        "token": token,
    };
}
