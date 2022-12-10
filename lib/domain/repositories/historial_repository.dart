import 'package:dartz/dartz.dart';
import 'package:recog_plantify/core/utils/failure.dart';
import 'package:recog_plantify/domain/entities/query.dart';

abstract class HistorialRepository {
  Future<Either<Failure, List<Query>>> getAllRecords();
  
  Future<Either<Failure, Unit>> addRecord(Query plantQuery);
  
  Future<Either<Failure, Unit>> deleteRecord(String id);
}
