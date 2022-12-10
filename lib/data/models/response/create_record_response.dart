import 'dart:convert';

CreateRecordResponse createRecordResponseFromJson(String str) => CreateRecordResponse.fromJson(json.decode(str));

String createRecordResponseToJson(CreateRecordResponse data) => json.encode(data.toJson());

class CreateRecordResponse {
    CreateRecordResponse({
        required this.ok,
        required this.message,
        required this.history,
    });

    final bool ok;
    final String message;
    final History history;

    factory CreateRecordResponse.fromJson(Map<String, dynamic> json) => CreateRecordResponse(
        ok: json["ok"],
        message: json["message"],
        history: History.fromJson(json["history"]),
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "message": message,
        "history": history.toJson(),
    };
}

class History {
    History({
        required this.user,
        required this.content,
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    final String user;
    final String content;
    final String id;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int v;

    factory History.fromJson(Map<String, dynamic> json) => History(
        user: json["user"],
        content: json["content"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "content": content,
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
