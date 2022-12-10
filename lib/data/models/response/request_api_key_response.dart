import 'dart:convert';

RequestApiKeyResponse requestApiKeyReponseFromJson(String str) => RequestApiKeyResponse.fromJson(json.decode(str));

String requestApiKeyReponseToJson(RequestApiKeyResponse data) => json.encode(data.toJson());

class RequestApiKeyResponse {
    RequestApiKeyResponse({
        required this.ok,
        required this.message,
        required this.err,
    });

    final bool ok;
    final String message;
    final Err err;

    factory RequestApiKeyResponse.fromJson(Map<String, dynamic> json) => RequestApiKeyResponse(
        ok: json["ok"],
        message: json["message"],
        err: Err.fromJson(json["err"]),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "message": message,
        "err": err.toJson(),
    };
}

class Err {
    Err({
        required this.name,
    });

    final String name;

    factory Err.fromJson(Map<String, dynamic> json) => Err(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}
