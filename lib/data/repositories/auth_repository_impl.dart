import 'package:dartz/dartz.dart';
import 'package:recog_plantify/core/utils/failure.dart';
import 'package:recog_plantify/data/datasources/auth_datasource.dart';
import 'package:recog_plantify/domain/entities/user.dart';
import 'package:recog_plantify/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({required this.dataSource});

  final AuthDataSource dataSource;

  @override
  Future<Either<Failure, User>> login(String userName, String password) async {
    try {
      final loginResponse = await dataSource.login(userName, password);
      return Right(User.fromLoginResponse(loginResponse));
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, Unit>> register(String username, String email,
      String password, String firstname, String lastname) async {
    try {
      await dataSource.register(username, email, password, firstname, lastname);
      return const Right(unit);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
