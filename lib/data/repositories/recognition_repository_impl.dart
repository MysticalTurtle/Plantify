import 'package:dartz/dartz.dart';
import 'package:recog_plantify/core/utils/failure.dart';
import 'package:recog_plantify/data/datasources/recognition_datasource.dart';
import 'package:recog_plantify/domain/repositories/recognition_repository.dart';

class RecognitionRepositoryImpl extends RecognitionRepository {
  RecognitionRepositoryImpl({required this.dataSource});

  final RecognitionDataSource dataSource;

  @override
  Future<Either<Failure, Unit>> recognizePlant(String token) async {
    try {
      await dataSource.recognizePlant(token);
      return const Right(unit);
    } catch (e) {
      return Left(Failure(message: e.toString(), isBackend: false));
    }
  }
}