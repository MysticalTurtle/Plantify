import 'package:dartz/dartz.dart';
import 'package:recog_plantify/core/utils/failure.dart';

abstract class ApiKeyRepository {
  Future<Either<Failure, Unit>> sendEmail(String token);
  
  Future<Either<Failure, Unit>> requestApiKey(String token);

  Future<Either<Failure, String>> checkApiKey();
}
