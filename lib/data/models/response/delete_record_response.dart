import 'dart:convert';

DeleteRecordResponse deleteRecordResponseFromJson(String str) => DeleteRecordResponse.fromJson(json.decode(str));

String deleteRecordResponseToJson(DeleteRecordResponse data) => json.encode(data.toJson());

class DeleteRecordResponse {
    DeleteRecordResponse({
        required this.ok,
        required this.message,
        required this.history,
    });

    final bool ok;
    final String message;
    final dynamic history;

    factory DeleteRecordResponse.fromJson(Map<String, dynamic> json) => DeleteRecordResponse(
        ok: json["ok"],
        message: json["message"],
        history: json["history"],
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "message": message,
        "history": history,
    };
}
