import 'package:movie_app/features/auth/domain/user.dart';

class UserDto {
  final int id;
  final String username;
  final String password;
  final String firstName;
  final String lastName;

  const UserDto({
    required this.id,
    required this.username,
    required this.password,
    required this.firstName,
    required this.lastName,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'] ?? 0,
      username: json['username'] ?? '',
      password: json['password'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ??  '',
    );
  }

  User toUser(){
    return User(firstName: firstName, lastName: lastName);
  }
}