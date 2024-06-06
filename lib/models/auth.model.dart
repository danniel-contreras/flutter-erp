import 'dart:convert';

class AuthPayload {
  final String userName;
  final String password;

  AuthPayload({
    required this.userName,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {'userName': userName, 'password': password};
  }

  String toJson() => json.encode(toMap());
}
