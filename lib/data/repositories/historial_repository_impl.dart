import 'package:dartz/dartz.dart';
import 'package:recog_plantify/core/config/preferences.dart';
import 'package:recog_plantify/core/utils/failure.dart';
import 'package:recog_plantify/data/datasources/historial_datasource.dart';
import 'package:recog_plantify/data/models/request/add_record_request.dart';
import 'package:recog_plantify/domain/entities/plant.dart';
import 'package:recog_plantify/domain/repositories/historial_repository.dart';

class HistorialRepositoryImpl extends HistorialRepository {
  HistorialRepositoryImpl({required this.dataSource});

  final HistorialDataSource dataSource;

  @override
  Future<Either<Failure, List<PlantRecord>>> getAllRecords() async {
    try {
      final prefs = SecureStoragePlantify();
      final String? token = await prefs.getPlantIdToken();
      if (token == null) {
        return Left(Failure(message: "No se ha encontrado el token", isBackend: false));
      }
      var response = await dataSource.getHistorial(token);
      // TODO: Implementar el mapeo de la respuesta
      throw UnimplementedError();
      // return Right(response);
    } catch (e) {
      return Left(Failure(message: e.toString(), isBackend: false));
    }
  }

  @override
  Future<Either<Failure, Unit>> addRecord(PlantRecord plantRecord) async {
    try {
      final prefs = SecureStoragePlantify();
      final String? token = await prefs.getPlantIdToken();
      if (token == null) {
        return Left(Failure(message: "No se ha encontrado el token", isBackend: false));
      }
      var request = AddRecordRequest.fromPlantRecord(plantRecord);
      var response = await dataSource.addRecord(token, request);
      // TODO: Implementar el mapeo de la respuesta
      throw UnimplementedError();
      // return Right(response);
    } catch (e) {
      return Left(Failure(message: e.toString(), isBackend: false));
    }
  }
  
  @override
  Future<Either<Failure, Unit>> deleteRecord(String id) async {
    try {
      final prefs = SecureStoragePlantify();
      final String? token = await prefs.getPlantIdToken();
      if (token == null) {
        return Left(Failure(message: "No se ha encontrado el token", isBackend: false));
      }
      var response = await dataSource.deleteRecord(token, id);

      if (!response.ok) return Left(Failure(message: response.message, isBackend: true));
      
      return const Right(unit);
    } catch (e) {
      return Left(Failure(message: e.toString(), isBackend: false));
    }
  }
}