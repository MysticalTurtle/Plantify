import 'package:recog_plantify/data/models/user_model.dart';

class User {
  final String name;
  final String lastName;
  final String userName;
  final String email;
  final String token;
  final int credits;

  const User({
    required this.name,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.token,
    required this.credits,
  });

  factory User.fromUserModel(UserModel userModel) {
    return User(
      name: userModel.name,
      lastName: userModel.lastName,
      userName: userModel.userName,
      email: userModel.email,
      token: userModel.token,
      credits: userModel.credits,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      lastName: json['lastName'],
      userName: json['username'],
      email: json['email'],
      token: json['token'],
      credits: 20, //json['credits'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lastName': lastName,
      'userName': userName,
      'email': email,
      'token': token,
      'credits': 20,
    };
  }

  @override
  String toString() {
    return 'User{name: $name, lastName: $lastName, userName: $userName, email: $email, credits: $credits}';
  }
}