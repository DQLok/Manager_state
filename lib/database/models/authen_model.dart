import 'dart:convert';

class AuthenModel {
    final String username;
    final int password;

    AuthenModel({
        required this.username,
        required this.password,
    });

    AuthenModel copyWith({
        String? username,
        int? password,
    }) => 
        AuthenModel(
            username: username ?? this.username,
            password: password ?? this.password,
        );

    factory AuthenModel.fromRawJson(String str) => AuthenModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AuthenModel.fromJson(Map<String, dynamic> json) => AuthenModel(
        username: json["username"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
    };
}
