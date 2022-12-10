import 'dart:convert';

import 'plant.dart';

Query queryModelFromJson(String str) => Query.fromJson(json.decode(str));

String queryModelToJson(Query data) => json.encode(data.toJson());

class Query {
  Query({
    required this.plants,
    required this.date,
    required this.time,
  });

  final List<Plant> plants;
  final String date;
  final String time;

  factory Query.fromJson(Map<String, dynamic> json) => Query(
        plants: List<Plant>.from(json["plants"].map((x) => Plant.fromJson(x))),
        date: json["date"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "plants": List<dynamic>.from(plants.map((x) => x.toJson())),
        "date": date,
        "time": time,
      };
}
