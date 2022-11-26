import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

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
        required this.apiKey,
        required this.remainingCredits,
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.username,
        required this.email,
        required this.createdAt,
        required this.isAdmin,
    });

    final dynamic apiKey;
    final dynamic remainingCredits;
    final String id;
    final String firstName;
    final String lastName;
    final String username;
    final String email;
    final String createdAt;
    final bool isAdmin;

    factory User.fromJson(Map<String, dynamic> json) => User(
        apiKey: json["apiKey"],
        remainingCredits: json["remainingCredits"],
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        username: json["username"],
        email: json["email"],
        createdAt: json["createdAt"],
        isAdmin: json["isAdmin"],
    );

    Map<String, dynamic> toJson() => {
        "apiKey": apiKey,
        "remainingCredits": remainingCredits,
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "username": username,
        "email": email,
        "createdAt": createdAt,
        "isAdmin": isAdmin,
    };
}
