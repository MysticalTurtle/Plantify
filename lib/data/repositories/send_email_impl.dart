import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:recog_plantify/core/utils/failure.dart';
import 'package:recog_plantify/data/datasources/verify_email.dart';
import 'package:recog_plantify/domain/repositories/verify_email_repository.dart';

class SendEmailRepositoryImpl extends SendEmailRepository {
  SendEmailRepositoryImpl({required this.dataSource});

  final SendEmailDataSource dataSource;


  @override
  Future<Either<Failure, Unit>> sendEmail(String token) async {
    try {
      var response = await dataSource.sendEmail(token);
      return const Right(Unit);
    } catch (e) {
      return Left(Failure(message: e.toString(), isBackend: false));
    }
  }
}