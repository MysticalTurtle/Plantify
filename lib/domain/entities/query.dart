import 'dart:convert';

import 'package:recog_plantify/domain/entities/plant.dart';

Query recognitionResponseFromJson(String str) =>
    Query.fromJson(json.decode(str));

String recognitionResponseToJson(Query data) =>
    json.encode(data.toJson());

class Query {
  Query({
    required this.id,
    required this.customId,
    required this.images,
    required this.suggestions,
    required this.modifiers,
    required this.secret,
    required this.failCause,
    required this.countable,
    required this.feedback,
    required this.isPlantProbability,
    required this.isPlant,
  });

  final int id;
  final dynamic customId;
  final List<Image> images;
  final List<Plant> suggestions;
  final List<String> modifiers;
  final String secret;
  final dynamic failCause;
  final bool countable;
  final dynamic feedback;
  final double isPlantProbability;
  final bool isPlant;

  factory Query.fromJson(Map<String, dynamic> json) =>
      Query(
        id: json["id"],
        customId: json["custom_id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        suggestions: List<Plant>.from(
            json["suggestions"].map((x) => Plant.fromJson(x))),
        modifiers: List<String>.from(json["modifiers"].map((x) => x)),
        secret: json["secret"],
        failCause: json["fail_cause"],
        countable: json["countable"],
        feedback: json["feedback"],
        isPlantProbability: json["is_plant_probability"].toDouble(),
        isPlant: json["is_plant"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "custom_id": customId,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "suggestions": List<dynamic>.from(suggestions.map((x) => x.toJson())),
        "modifiers": List<dynamic>.from(modifiers.map((x) => x)),
        "secret": secret,
        "fail_cause": failCause,
        "countable": countable,
        "feedback": feedback,
        "is_plant_probability": isPlantProbability,
        "is_plant": isPlant,
      };
}

class Image {
  Image({
    required this.url,
  });

  final String url;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
