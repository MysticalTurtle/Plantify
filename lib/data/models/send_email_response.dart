import 'dart:convert';

SendEmailResponse verifyEmailResponseFromJson(String str) => SendEmailResponse.fromJson(json.decode(str));

class SendEmailResponse {
    SendEmailResponse({
        required this.ok,
        required this.message,
        required this.err,
    });

    final bool ok;
    final String message;
    final Err? err;

    factory SendEmailResponse.fromJson(Map<String, dynamic> json) => SendEmailResponse(
        ok: json["ok"],
        message: json["message"],
        err: json["err"] == null ? null : Err.fromJson(json["err"]),
    );

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
