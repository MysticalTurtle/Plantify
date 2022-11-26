import 'package:dartz/dartz.dart';
import 'package:recog_plantify/core/utils/failure.dart';

abstract class VerifyEmailRepository {
  Future<Either<Failure, String>> verifyEmail(String token);
}
