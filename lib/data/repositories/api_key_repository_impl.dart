import 'package:dartz/dartz.dart';
import 'package:recog_plantify/core/utils/failure.dart';
import 'package:recog_plantify/data/datasources/api_key_datasource.dart';
import 'package:recog_plantify/domain/repositories/api_key_repository.dart';

class ApiKeyRepositoryImpl extends ApiKeyRepository {
  ApiKeyRepositoryImpl({required this.dataSource});

  final ApiKeyDataSource dataSource;

  @override
  Future<Either<Failure, Unit>> sendEmail(String token) async {
    try {
      var response = await dataSource.sendEmail(token);

      if (!response.ok) {
        throw Exception("Error al enviar el correo"); // Message errors should be in spanish
      }
      
      return const Right(unit);
      
    } catch (e) {
      return Left(Failure(message: e.toString(), isBackend: false));
    }
  }

  @override
  Future<Either<Failure, Unit>> requestApiKey(String token) async {
    try {

      var response = await dataSource.requestApiKey(token);

      if (response.ok == false) {
        throw Exception("Error al generar el ApiKey de Plantify");
      }

      return const Right(unit);

    } catch (e) {
      return Left(Failure(message: e.toString(), isBackend: false));
    }
  }
}
