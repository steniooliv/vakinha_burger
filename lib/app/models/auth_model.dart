import 'dart:convert';

class AuthModel {
  final String accessToken;
  final String refreshToken;

  AuthModel(
    this.accessToken,
    this.refreshToken,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      map['accessToken'] ?? '',
      map['refreshToken'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
