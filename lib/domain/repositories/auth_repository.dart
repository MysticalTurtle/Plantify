import 'package:dartz/dartz.dart';
import 'package:recog_plantify/core/utils/failure.dart';
import 'package:recog_plantify/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login(String userName, String password);
  
  Future<Either<Failure, String>> register(String username, String email,String  password,String firstname, String lastname);

  Future<User?> getUser();

  Future<String?> getToken();

  Future<void> saveUser(User user);
}
