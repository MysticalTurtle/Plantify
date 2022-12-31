import 'dart:convert';

import 'package:recog_plantify/domain/entities/plant.dart';

Query recognitionResponseFromJson(String str) =>
    Query.fromJson(json.decode(str));

String recognitionResponseToJson(Query data) => json.encode(data.toJson());

class Query {
  Query({
    required this.id,
    required this.customId,
    this.images,
    this.suggestions,
    required this.secret,
    required this.failCause,
    required this.countable,
    required this.feedback,
    required this.isPlantProbability,
    required this.isPlant,
  });

  final int id;
  final dynamic customId;
  final List<Image?>? images;
  final List<Plant?>? suggestions;
  final String secret;
  final dynamic failCause;
  final bool countable;
  final dynamic feedback;
  final double isPlantProbability;
  final bool isPlant;

  factory Query.fromJson(Map<String, dynamic> json) {
    print("Suggestions: ${json["suggestions"]}");
    print("Images: ${json["images"]}");
    print("Images: ${json["images"][0]}");

    return Query(
      id: json["id"],
      customId: json["custom_id"],
      images:
          (json["images"] as List<dynamic>).map<Image>((x) => Image.fromJson(x)).toList() ?? [],
      suggestions: (json["suggestions"] as List<dynamic>).map<Plant>((x) => Plant.fromJson(x)).toList() ?? [],
      secret: json["secret"],
      failCause: json["fail_cause"],
      countable: json["countable"],
      feedback: json["feedback"],
      isPlantProbability: json["is_plant_probability"].toDouble(),
      isPlant: json["is_plant"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "custom_id": customId,
        // "images": images != null
        //     ? List<dynamic>.from(images.map((x) => x.toJson()))
        //     : null,
        // "suggestions": false
        //     ? List<dynamic>.from(suggestions.map((x) => x.toJson()))
        //     : null,
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
