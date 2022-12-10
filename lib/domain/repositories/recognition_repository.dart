import 'package:dartz/dartz.dart';
import 'package:recog_plantify/core/utils/failure.dart';
import 'package:recog_plantify/domain/entities/query.dart';

abstract class RecognitionRepository {
  Future<Either<Failure, Query>> recognizePlant(String imagePath);
}