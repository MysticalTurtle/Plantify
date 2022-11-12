import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    required this.ok,
    required this.message,
    required this.token,
    required this.user,
  });

  final bool ok;
  final String message;
  final String token;
  final User user;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    ok: json["ok"],
    message: json["message"],
    token: json["token"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "ok": ok,
    "message": message,
    "token": token,
    "user": user.toJson(),
  };
}

class User {
  User({
    required this.isNew,
    required this.doc,
    required this.isAdmin,
  });

  final bool isNew;
  final Doc doc;
  final bool isAdmin;

  factory User.fromJson(Map<String, dynamic> json) => User(
    isNew: json["\u0024isNew"],
    doc: Doc.fromJson(json["_doc"]),
    isAdmin: json["isAdmin"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024isNew": isNew,
    "_doc": doc.toJson(),
    "isAdmin": isAdmin,
  };
}

class Doc {
  Doc({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.password,
    required this.createdAt,
    required this.v,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String password;
  final DateTime createdAt;
  final int v;

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
    id: json["_id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    username: json["username"],
    email: json["email"],
    password: json["password"],
    createdAt: DateTime.parse(json["createdAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstName": firstName,
    "lastName": lastName,
    "username": username,
    "email": email,
    "password": password,
    "createdAt": createdAt.toIso8601String(),
    "__v": v,
  };
}
