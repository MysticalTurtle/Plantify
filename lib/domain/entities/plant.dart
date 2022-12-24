import 'dart:convert';

Plant plantFromJson(String str) => Plant.fromJson(json.decode(str));

String plantToJson(Plant data) => json.encode(data.toJson());

class Plant {
    Plant({
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

    factory Plant.fromJson(Map<String, dynamic> json) => Plant(
        id: json["id"],
        plantName: json["plant_name"],
        plantDetails: PlantDetails.fromJson(json["plant_details"]),
        probability: json["probability"].toDouble(),
        confirmed: json["confirmed"],
        similarImages: List<SimilarImage>.from(json["similar_images"].map((x) => SimilarImage.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "plant_name": plantName,
        "plant_details": plantDetails.toJson(),
        "probability": probability,
        "confirmed": confirmed,
        "similar_images": List<dynamic>.from(similarImages.map((x) => x.toJson())),
    };
}

class PlantDetails {
    PlantDetails({
        required this.commonNames,
        required this.url,
        required this.wikiDescription,
        required this.taxonomy,
        required this.synonyms,
        required this.edibleParts,
        required this.watering,
        required this.wikiImage,
        required this.wikiImages,
        required this.language,
        required this.scientificName,
        required this.structuredName,
    });

    final List<String> commonNames;
    final String url;
    final Wiki wikiDescription;
    final Taxonomy taxonomy;
    final List<String> synonyms;
    final List<String> edibleParts;
    final Watering watering;
    final Wiki wikiImage;
    final List<Wiki> wikiImages;
    final String language;
    final String scientificName;
    final StructuredName structuredName;

    factory PlantDetails.fromJson(Map<String, dynamic> json) => PlantDetails(
        commonNames: List<String>.from(json["common_names"].map((x) => x)),
        url: json["url"],
        wikiDescription: Wiki.fromJson(json["wiki_description"]),
        taxonomy: Taxonomy.fromJson(json["taxonomy"]),
        synonyms: List<String>.from(json["synonyms"].map((x) => x)),
        edibleParts: List<String>.from(json["edible_parts"].map((x) => x)),
        watering: Watering.fromJson(json["watering"]),
        wikiImage: Wiki.fromJson(json["wiki_image"]),
        wikiImages: List<Wiki>.from(json["wiki_images"].map((x) => Wiki.fromJson(x))),
        language: json["language"],
        scientificName: json["scientific_name"],
        structuredName: StructuredName.fromJson(json["structured_name"]),
    );

    Map<String, dynamic> toJson() => {
        "common_names": List<dynamic>.from(commonNames.map((x) => x)),
        "url": url,
        "wiki_description": wikiDescription.toJson(),
        "taxonomy": taxonomy.toJson(),
        "synonyms": List<dynamic>.from(synonyms.map((x) => x)),
        "edible_parts": List<dynamic>.from(edibleParts.map((x) => x)),
        "watering": watering.toJson(),
        "wiki_image": wikiImage.toJson(),
        "wiki_images": List<dynamic>.from(wikiImages.map((x) => x.toJson())),
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

class Watering {
    Watering({
        required this.max,
        required this.min,
    });

    final int max;
    final int min;

    factory Watering.fromJson(Map<String, dynamic> json) => Watering(
        max: json["max"],
        min: json["min"],
    );

    Map<String, dynamic> toJson() => {
        "max": max,
        "min": min,
    };
}

class Wiki {
    Wiki({
        required this.value,
        this.citation,
        required this.licenseName,
        required this.licenseUrl,
    });

    final String value;
    final String? citation;
    final String licenseName;
    final String licenseUrl;

    factory Wiki.fromJson(Map<String, dynamic> json) => Wiki(
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
        required this.urlSmall,
        required this.citation,
        required this.licenseName,
        required this.licenseUrl,
    });

    final String id;
    final double similarity;
    final String url;
    final String urlSmall;
    final String citation;
    final String licenseName;
    final String licenseUrl;

    factory SimilarImage.fromJson(Map<String, dynamic> json) => SimilarImage(
        id: json["id"],
        similarity: json["similarity"].toDouble(),
        url: json["url"],
        urlSmall: json["url_small"],
        citation: json["citation"],
        licenseName: json["license_name"],
        licenseUrl: json["license_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "similarity": similarity,
        "url": url,
        "url_small": urlSmall,
        "citation": citation,
        "license_name": licenseName,
        "license_url": licenseUrl,
    };
}
