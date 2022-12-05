import 'package:dartz/dartz.dart';
import 'package:recog_plantify/core/utils/failure.dart';

abstract class RecognitionRepository {
  Future<Either<Failure, Unit>> recognizePlant(String token, String image);
}