class UserModel {
  final String name;
  final String lastName;
  final String userName;
  final String email;
  final String token;
  final int credits;

  const UserModel({
    required this.name,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.token,
    required this.credits,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['user']['_doc']['firstName'],
      lastName: json['user']['_doc']['lastName'],
      userName: json['user']['_doc']['username'],
      email: json['user']['_doc']['email'],
      token: json['token'],
      credits: 20, //json['credits'],
    );
  }
}
