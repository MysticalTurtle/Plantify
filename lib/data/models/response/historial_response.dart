import 'dart:convert';
import 'package:recog_plantify/domain/entities/query.dart';


HistorialResponse historialResponseFromJson(String str) =>
    HistorialResponse.fromJson(json.decode(str));

String historialResponseToJson(HistorialResponse data) =>
    json.encode(data.toJson());

class HistorialResponse {
  HistorialResponse({
    required this.ok,
    required this.message,
    required this.history,
  });

  final bool ok;
  final String message;
  final List<History> history;

  factory HistorialResponse.fromJson(Map<String, dynamic> json) =>
      HistorialResponse(
        ok: json["ok"],
        message: json["message"],
        history:
            List<History>.from(json["history"].map((x) => History.fromJson(x))),
      );

  // factory to querylist
  List<Query> toQueryList() {
    List<Query> queryList = [];
    for (var item in history) {
      queryList.add(Query.fromJson(json.decode(item.content)));
    }
    return queryList;
  }

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "message": message,
        "history": List<dynamic>.from(history.map((x) => x.toJson())),
      };
}

class History {
  History({
    required this.id,
    required this.user,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String id;
  final String user;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  factory History.fromJson(Map<String, dynamic> json) => History(
        id: json["_id"],
        user: json["user"],
        content: json["content"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "content": content,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
