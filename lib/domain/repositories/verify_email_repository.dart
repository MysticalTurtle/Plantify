import 'package:dartz/dartz.dart';
import 'package:recog_plantify/core/utils/failure.dart';

abstract class SendEmailRepository {
  Future<Either<Failure, Unit>> sendEmail(String token);
}
