import 'package:recog_plantify/data/models/login_response.dart' as lr;

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

  factory User.fromUserModel(User userResponse) {
    return User(
      name: userResponse.name,
      lastName: userResponse.lastName,
      userName: userResponse.userName,
      email: userResponse.email,
      token: userResponse.token,
      credits: userResponse.credits,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      lastName: json['lastName'],
      userName: json['userName'],
      email: json['email'],
      token: json['token'],
      credits: json['credits'],
    );
  }

  // from loginResponse
  factory User.fromLoginResponse(lr.LoginResponse loginResponse) {
    return User(
      name: loginResponse.user.doc.firstName,
      lastName: loginResponse.user.doc.lastName,
      userName: loginResponse.user.doc.username,
      email: loginResponse.user.doc.email,
      token: loginResponse.token,
      credits: 20, //loginResponse.credits,
    );
  }

  Map<String, dynamic> toJson() => {    
      'name': name,
      'lastName': lastName,
      'userName': userName,
      'email': email,
      'token': token,
      'credits': 20,
    };
  

  @override
  String toString() {
    return 'User{name: $name, lastName: $lastName, userName: $userName, email: $email, credits: $credits}';
  }
}
