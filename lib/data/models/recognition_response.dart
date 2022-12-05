import 'dart:convert';

RecognitionResponse suggestionModelFromJson(String str) =>
    RecognitionResponse.fromJson(json.decode(str));

String suggestionModelToJson(RecognitionResponse data) =>
    json.encode(data.toJson());

class RecognitionResponse {
  RecognitionResponse({
    required this.id,
    required this.customId,
    required this.metaData,
    required this.uploadedDatetime,
    required this.finishedDatetime,
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
  final MetaData metaData;
  final double uploadedDatetime;
  final double finishedDatetime;
  final List<Image> images;
  final List<Suggestion> suggestions;
  final List<String> modifiers;
  final String secret;
  final dynamic failCause;
  final bool countable;
  final dynamic feedback;
  final double isPlantProbability;
  final bool isPlant;

  factory RecognitionResponse.fromJson(Map<String, dynamic> json) =>
      RecognitionResponse(
        id: json["id"],
        customId: json["custom_id"],
        metaData: MetaData.fromJson(json["meta_data"]),
        uploadedDatetime: json["uploaded_datetime"].toDouble(),
        finishedDatetime: json["finished_datetime"].toDouble(),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        suggestions: List<Suggestion>.from(
            json["suggestions"].map((x) => Suggestion.fromJson(x))),
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
        "meta_data": metaData.toJson(),
        "uploaded_datetime": uploadedDatetime,
        "finished_datetime": finishedDatetime,
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
    required this.fileName,
    required this.url,
  });

  final String fileName;
  final String url;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        fileName: json["file_name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "file_name": fileName,
        "url": url,
      };
}

class MetaData {
  MetaData({
    required this.latitude,
    required this.longitude,
    required this.date,
    required this.datetime,
  });

  final dynamic latitude;
  final dynamic longitude;
  final DateTime date;
  final DateTime datetime;

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        latitude: json["latitude"],
        longitude: json["longitude"],
        date: DateTime.parse(json["date"]),
        datetime: DateTime.parse(json["datetime"]),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "datetime":
            "${datetime.year.toString().padLeft(4, '0')}-${datetime.month.toString().padLeft(2, '0')}-${datetime.day.toString().padLeft(2, '0')}",
      };
}

class Suggestion {
  Suggestion({
    required this.id,
    required this.plantName,
    required this.plantDetails,
    required this.probability,
    required this.confirmed,
    required this.similarImages,
  });

  final int id;
  final String plantName;
  final PlantDetails plantDetails;
  final double probability;
  final bool confirmed;
  final List<SimilarImage> similarImages;

  factory Suggestion.fromJson(Map<String, dynamic> json) => Suggestion(
        id: json["id"],
        plantName: json["plant_name"],
        plantDetails: PlantDetails.fromJson(json["plant_details"]),
        probability: json["probability"].toDouble(),
        confirmed: json["confirmed"],
        similarImages: List<SimilarImage>.from(
            json["similar_images"].map((x) => SimilarImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "plant_name": plantName,
        "plant_details": plantDetails.toJson(),
        "probability": probability,
        "confirmed": confirmed,
        "similar_images":
            List<dynamic>.from(similarImages.map((x) => x.toJson())),
      };
}

class PlantDetails {
  PlantDetails({
    required this.commonNames,
    required this.url,
    this.wikiDescription,
    required this.taxonomy,
    required this.synonyms,
    required this.language,
    required this.scientificName,
    required this.structuredName,
  });

  final List<String> commonNames;
  final String url;
  final WikiDescription? wikiDescription;
  final Taxonomy taxonomy;
  final List<String> synonyms;
  final String language;
  final String scientificName;
  final StructuredName structuredName;

  factory PlantDetails.fromJson(Map<String, dynamic> json) => PlantDetails(
        commonNames: List<String>.from(json["common_names"].map((x) => x)),
        url: json["url"],
        wikiDescription: WikiDescription.fromJson(json["wiki_description"]),
        taxonomy: Taxonomy.fromJson(json["taxonomy"]),
        synonyms: List<String>.from(json["synonyms"].map((x) => x)),
        language: json["language"],
        scientificName: json["scientific_name"],
        structuredName: StructuredName.fromJson(json["structured_name"]),
      );

  Map<String, dynamic> toJson() => {
        "common_names": commonNames == null
            ? null
            : List<dynamic>.from(commonNames.map((x) => x)),
        "url": url,
        "wiki_description": wikiDescription?.toJson(),
        "taxonomy": taxonomy.toJson(),
        "synonyms": List<dynamic>.from(synonyms.map((x) => x)),
        "language": language,
        "scientific_name": scientificName,
        "structured_name": structuredName.toJson(),
      };
}

class StructuredName {
  StructuredName({
    required this.genus,
    required this.species,
  });

  final String genus;
  final String species;

  factory StructuredName.fromJson(Map<String, dynamic> json) => StructuredName(
        genus: json["genus"],
        species: json["species"],
      );

  Map<String, dynamic> toJson() => {
        "genus": genus,
        "species": species,
      };
}

class Taxonomy {
  Taxonomy({
    required this.taxonomyClass,
    required this.family,
    required this.genus,
    required this.kingdom,
    required this.order,
    required this.phylum,
  });

  final String taxonomyClass;
  final String family;
  final String genus;
  final String kingdom;
  final String order;
  final String phylum;

  factory Taxonomy.fromJson(Map<String, dynamic> json) => Taxonomy(
        taxonomyClass: json["class"],
        family: json["family"],
        genus: json["genus"],
        kingdom: json["kingdom"],
        order: json["order"],
        phylum: json["phylum"],
      );

  Map<String, dynamic> toJson() => {
        "class": taxonomyClass,
        "family": family,
        "genus": genus,
        "kingdom": kingdom,
        "order": order,
        "phylum": phylum,
      };
}

class WikiDescription {
  WikiDescription({
    required this.value,
    required this.citation,
    required this.licenseName,
    required this.licenseUrl,
  });

  final String value;
  final String citation;
  final String licenseName;
  final String licenseUrl;

  factory WikiDescription.fromJson(Map<String, dynamic> json) =>
      WikiDescription(
        value: json["value"],
        citation: json["citation"],
        licenseName: json["license_name"],
        licenseUrl: json["license_url"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "citation": citation,
        "license_name": licenseName,
        "license_url": licenseUrl,
      };
}

class SimilarImage {
  SimilarImage({
    required this.id,
    required this.similarity,
    required this.url,
    // required this.urlSmall,
    // required this.citation,
    // required this.licenseName,
    // required this.licenseUrl,
  });

  final String id;
  final double similarity;
  final String url;
  // final String urlSmall;
  // final String citation;
  // final String licenseName;
  // final String licenseUrl;

  factory SimilarImage.fromJson(Map<String, dynamic> json) => SimilarImage(
        id: json["id"],
        similarity: json["similarity"].toDouble(),
        url: json["url"],
        // urlSmall: json["url_small"],
        // citation: json["citation"] == null ? null : json["citation"],
        // licenseName: json["license_name"] == null ? null : json["license_name"],
        // licenseUrl: json["license_url"] == null ? null : json["license_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "similarity": similarity,
        "url": url,
        // "url_small": urlSmall,
        // "citation": citation == null ? null : citation,
        // "license_name": licenseName == null ? null : licenseName,
        // "license_url": licenseUrl == null ? null : licenseUrl,
      };
}
