import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:recog_plantify/core/utils/failure.dart';
import 'package:recog_plantify/domain/entities/query.dart';

abstract class RecognitionDataSource {
  Future<Query> recognizePlant(String token, String imagePath);
}

class RecognitionDataSourceImpl implements RecognitionDataSource {
  RecognitionDataSourceImpl();

  @override
  Future<Query> recognizePlant(
      String token, String imagePath) async {
    String url = 'https://api.plant.id/v2/identify';
    var dio = Dio();
    dio.options.headers['Api-Key'] = token;

    FormData formData = FormData.fromMap({
      "data":
          '{"plant_details": ["common_names", "url","wiki_description", "taxonomy", "synonyms", "edible_parts","watering", "wiki_image", "wiki_images" ], "modifiers": ["similar_images"], "plant_language": "es"}',
      "images": [await MultipartFile.fromFile('imagePath')]
    });

    try {
      var response = await dio.post(url, data: formData);
      return Query.fromJson(response.data);
    } catch (e) {
      debugPrint("ERROR>>>>>>> ${e.toString()}");
      throw Failure(message: "Error al reconocer la imagen", isBackend: true);
    }
  }
}
