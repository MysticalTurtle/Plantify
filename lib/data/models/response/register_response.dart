import 'dart:convert';
import 'error.dart' show Error;

RegisterResponse registerResponseFromJson(String str) => RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) => json.encode(data.toJson());

class RegisterResponse {
    RegisterResponse({
        this.ok,
        this.message,
        this.token,
        this.errors,
    });

    final bool? ok;
    final String? message;
    final String? token;
    final List<Error>? errors;

    factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
        ok: json["ok"],
        message: json["message"],
        token: json["token"],
        errors: json["errors"] == null ? null : List<Error>.from(json["errors"].map((x) => Error.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "message": message,
        "token": token,
        "errors": errors == null ? null : List<dynamic>.from(errors!.map((x) => x.toJson())),
    };
}