import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:recog_plantify/core/utils/failure.dart';
import 'package:recog_plantify/data/datasources/verify_email.dart';
import 'package:recog_plantify/domain/repositories/api_key_repository.dart';

class ApiKeyRepositoryImpl extends ApiKeyRepository {
  ApiKeyRepositoryImpl({required this.dataSource});

  final SendEmailDataSource dataSource;


  @override
  Future<Either<Failure, Unit>> sendEmail(String token) async {
    try {
      await dataSource.sendEmail(token);
      return const Right(unit);
    } catch (e) {
      return Left(Failure(message: e.toString(), isBackend: false));
    }
  }
  
  @override
  Future<Either<Failure, Unit>> requestApiKey(String token) {
    // TODO: implement requestApiKey
    throw UnimplementedError();
  }
}