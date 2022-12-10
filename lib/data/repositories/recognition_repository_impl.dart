import 'package:dartz/dartz.dart';
import 'package:recog_plantify/core/config/preferences.dart';
import 'package:recog_plantify/core/utils/failure.dart';
import 'package:recog_plantify/data/datasources/credits_datasource.dart';
import 'package:recog_plantify/data/datasources/recognition_datasource.dart';
import 'package:recog_plantify/domain/entities/query.dart';
import 'package:recog_plantify/domain/repositories/recognition_repository.dart';

class RecognitionRepositoryImpl extends RecognitionRepository {
  RecognitionRepositoryImpl({required this.plantDataSource, required this.creditsDataSource});

  final RecognitionDataSource plantDataSource;
  final CreditsDataSource creditsDataSource;

  @override
  Future<Either<Failure, Query>> recognizePlant(
      String imagePath) async {
    try {
      final prefs = SecureStoragePlantify();
      final String? token = await prefs.getPlantIdToken();
      if (token == null) {
        return Left(Failure(message: "No se ha encontrado el token", isBackend: false));
      }
      //Decrease 1 credit from the account
      await creditsDataSource.decreaseCredits(token, 1);
      
      // Recognize the plant
      var response = await plantDataSource.recognizePlant(token, imagePath);
      return Right(response);
    } catch (e) {
      return Left(Failure(message: e.toString(), isBackend: false));
    }
  }
}
