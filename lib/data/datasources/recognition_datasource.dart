import 'package:recog_plantify/data/models/recognition_response.dart';

abstract class RecognitionDataSource {
  Future<RecognitionResponse> recognizePlant(String token);
}