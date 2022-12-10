import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:recog_plantify/core/utils/failure.dart';
import 'package:recog_plantify/data/models/response/recognition_response.dart';

abstract class RecognitionDataSource {
  Future<RecognitionResponse> recognizePlant(String token, String imagePath);
}

class RecognitionDataSourceImpl implements RecognitionDataSource {
  RecognitionDataSourceImpl();

  @override
  Future<RecognitionResponse> recognizePlant(
      String token, String imagePath) async {
    String url = 'https://plantify-api.herokuapp.com/api/v1/plantify';
    var dio = Dio();
    dio.options.headers['Api-Key'] = token;

    FormData formData = FormData.fromMap({
      "data":
          '{"plant_details": ["common_names", "url","wiki_description", "taxonomy", "synonyms"], "modifiers": ["similar_images"], "plant_language": "es"}',
      "images": [await MultipartFile.fromFile('imagePath')]
    });

    try {
      var response = await dio.post(url, data: formData);
      return RecognitionResponse.fromJson(response.data);
    } catch (e) {
      debugPrint(e.toString());
      throw Failure(message: "Error al reconocer la imagen", isBackend: true);
    }
  }
}
