import 'package:dartz/dartz.dart';
import 'package:recog_plantify/core/utils/failure.dart';
import 'package:recog_plantify/domain/entities/plant_record.dart';

abstract class HistorialRepository {
  Future<Either<Failure, List<PlantRecord>>> getAllRecords(String token);
  
  Future<Either<Failure, Unit>> addPlantRecord(String token, PlantRecord plantRecord);
  
  Future<Either<Failure, Unit>> deletePlantRecord(String token, String id);
}
