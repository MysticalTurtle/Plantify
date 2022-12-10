import 'package:recog_plantify/data/models/response/login_response.dart' as lr;

class User {
  final String name;
  final String lastName;
  final String userName;
  final String email;
  final String token;
  final int credits;
  final String? apiKey;

  const User({
    required this.name,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.token,
    required this.credits,
    this.apiKey,
  });

  factory User.fromUserModel(User userResponse) {
    return User(
      name: userResponse.name,
      lastName: userResponse.lastName,
      userName: userResponse.userName,
      email: userResponse.email,
      token: userResponse.token,
      credits: userResponse.credits,
      apiKey: userResponse.apiKey,
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
      apiKey: json['apiKey'],
    );
  }

  // from loginResponse
  factory User.fromLoginResponse(lr.LoginResponse loginResponse) {
    return User(
      name: loginResponse.user.firstName,
      lastName: loginResponse.user.lastName,
      userName: loginResponse.user.username,
      email: loginResponse.user.email,
      token: loginResponse.token,
      credits: loginResponse.user.remainingCredits,
      apiKey: loginResponse.user.apiKey,
    );
  }

  Map<String, dynamic> toJson() => {    
      'name': name,
      'lastName': lastName,
      'userName': userName,
      'email': email,
      'token': token,
      'credits': credits,
      'apiKey': apiKey,
    };
  

  @override
  String toString() {
    return 'User(name: $name, lastName: $lastName, userName: $userName, email: $email, token: $token, credits: $credits, apiKey: $apiKey)';}
}
