import 'package:dartz/dartz.dart';
import 'package:recog_plantify/core/config/preferences.dart';
import 'package:recog_plantify/core/utils/failure.dart';
import 'package:recog_plantify/data/datasources/auth_datasource.dart';
import 'package:recog_plantify/domain/entities/user.dart';
import 'package:recog_plantify/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({required this.dataSource});

  final AuthDataSource dataSource;
  final prefs = SharedPreferencesPlantify();
  final securePrefs = SecureStoragePlantify();

  @override
  Future<Either<Failure, User>> login(String userName, String password) async {
    try {
      final loginResponse = await dataSource.login(userName, password);
      if (!loginResponse.ok) {
        return Left(Failure(message: loginResponse.message, isBackend: true));
      }
      return Right(User.fromLoginResponse(loginResponse));
    } catch (e) {
      return Left(Failure(message: "Error", isBackend: false));
    }
  }

  @override
  Future<Either<Failure, String>> register(String username, String email,
      String password, String firstname, String lastname) async {
    try {
      var response = await dataSource.register(
          username, email, password, firstname, lastname);
      if (!response.ok!) {
        final String error =
            response.errors != null ? response.errors!.first.msg : "Error";
        return Left(Failure(message: error, isBackend: true));
      }
      return Right(response.token!);
    } on Failure catch (e) {
      return Left(e);
    } on Exception catch (e) {
      throw "Error";
    }
  }

  @override
  Future<String?> getToken() {
    return securePrefs.getToken();
  }

  @override
  Future<User?> getUser() {
    return prefs.getUser();
  }

  @override
  Future<void> saveUser(User user) async {
    prefs.setUser(user);
    securePrefs.setToken(user.token);
  }
}
