import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:recog_plantify/core/utils/failure.dart';
import 'package:recog_plantify/domain/entities/query.dart';

abstract class RecognitionDataSource {
  Future<Query> recognizePlant(String token, String imagePath);
}

class RecognitionDataSourceImpl implements RecognitionDataSource {
  RecognitionDataSourceImpl();

  Future<String> sendPlant(String imagePath) async {
    String url = 'https://api.plant.id/v2/identify';
    var dio = Dio();
    dio.options.headers['Api-Key'] =
        "3IG8pt7WkS75KtlU81fN6sQV07cvqrhDMebn7fWEKTR3WDaf55";

    FormData formData = FormData.fromMap({
      "data":
          '{"plant_details": ["common_names", "url","wiki_description", "taxonomy", "synonyms", "edible_parts","watering", "wiki_image", "wiki_images" ], "modifiers": ["similar_images"], "plant_language": "es"}',
      "images": [await MultipartFile.fromFile(imagePath)]
    });

    try {
      var response = await dio.post(url, data: formData);
      return jsonEncode(response.data);
    } catch (e) {
      print(e);
      return "-1";
    }
  }


  @override
  Future<Query> recognizePlant(String token, String imagePath) async {
    String url = 'https://api.plant.id/v2/identify';
    var dio = Dio();
    dio.options.headers['Api-Key'] = token;

    FormData formData = FormData.fromMap({
      "data":
          '{"plant_details": ["common_names", "url","wiki_description", "taxonomy", "synonyms", "edible_parts","watering", "wiki_image", "wiki_images" ], "modifiers": ["similar_images"], "plant_language": "es"}',
      "images": [await MultipartFile.fromFile(imagePath)]
    });

    try {
      var response = await dio.post(url, data: formData);
//       var response = '''{
//     "id": 68096480,
//     "custom_id": null,
//     "meta_data": {
//         "latitude": null,
//         "longitude": null,
//         "date": "2022-12-24",
//         "datetime": "2022-12-24"
//     },
//     "uploaded_datetime": 1671895269.977329,
//     "finished_datetime": 1671895270.252108,
//     "images": [
//         {
//             "file_name": "90b040a4e976446591ae7a2e89eb823b.jpg",
//             "url": "https://plant.id/media/images/90b040a4e976446591ae7a2e89eb823b.jpg"
//         }
//     ],
//     "suggestions": [
//         {
//             "id": 385413510,
//             "plant_name": "Phalaenopsis",
//             "plant_details": {
//                 "common_names": [
//                     "orquídea alevilla",
//                     "orquídea mariposa",
//                     "orquídeas boca"
//                 ],
//                 "url": "https://es.wikipedia.org/wiki/Phalaenopsis",
//                 "wiki_description": {
//                     "value": "Phalaenopsis es un género de las comúnmente llamadas orquídea alevilla, orquídea mariposa y también orquídeas boca de aproximadamente 60 especies de orquídeas de la familia Orchidaceae. Son nativas de todo el sureste asiático.",
//                     "citation": "https://es.wikipedia.org/wiki/Phalaenopsis",
//                     "license_name": "CC BY-SA 3.0",
//                     "license_url": "https://creativecommons.org/licenses/by-sa/3.0/"
//                 },
//                 "taxonomy": {
//                     "class": "Magnoliopsida",
//                     "family": "Orchidaceae",
//                     "genus": "Phalaenopsis",
//                     "kingdom": "Plantae",
//                     "order": "Asparagales",
//                     "phylum": "Magnoliophyta"
//                 },
//                 "synonyms": [
//                     "Doritis",
//                     "Grafia",
//                     "Grussia",
//                     "Hygrochilus",
//                     "Kingidium",
//                     "Kingiella",
//                     "Lesliea",
//                     "Nothodoritis",
//                     "Ornithochilus",
//                     "Polychilos",
//                     "Polystylus",
//                     "Sedirea",
//                     "Stauritis",
//                     "Stauroglottis",
//                     "Synadena"
//                 ],
//                 "language": "es",
//                 "scientific_name": "Phalaenopsis",
//                 "structured_name": {
//                     "genus": "phalaenopsis"
//                 }
//             },
//             "probability": 0.9704424411194321,
//             "confirmed": false,
//             "similar_images": [
//                 {
//                     "id": "a114e2100b0fbf2021236b4ec6f3a927",
//                     "similarity": 0.287676253580243,
//                     "url": "https://plant-id.ams3.cdn.digitaloceanspaces.com/similar_images/images/a11/4e2100b0fbf2021236b4ec6f3a927.jpg",
//                     "url_small": "https://plant-id.ams3.cdn.digitaloceanspaces.com/similar_images/images/a11/4e2100b0fbf2021236b4ec6f3a927.small.jpg"
//                 },
//                 {
//                     "id": "0ec0da1f360610a5c576cf3aadd8fc55",
//                     "similarity": 0.2871887081940242,
//                     "url": "https://plant-id.ams3.cdn.digitaloceanspaces.com/similar_images/images/0ec/0da1f360610a5c576cf3aadd8fc55.jpg",
//                     "url_small": "https://plant-id.ams3.cdn.digitaloceanspaces.com/similar_images/images/0ec/0da1f360610a5c576cf3aadd8fc55.small.jpg"
//                 }
//             ]
//         }
//     ],
//     "modifiers": [
//         "similar_images"
//     ],
//     "secret": "QDfxRWkBqxX39v0",
//     "fail_cause": null,
//     "countable": true,
//     "feedback": null,
//     "is_plant_probability": 0.9964920520000001,
//     "is_plant": true
// }''';
      print(response);
      // print(response.data);
      // print(response.statusCode);
      return Query.fromJson(jsonDecode(response.data));
    } catch (e) {
      debugPrint("ERROR>>>>>>> ${e.toString()}");
      throw Failure(message: "Error al reconocer la imagen", isBackend: true);
    }
  }
}
