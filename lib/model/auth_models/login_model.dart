import 'dart:convert';

import 'package:artsays_app/constants/enums.dart';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

class LoginModel {
  final String message;
  final String? token;
  final UserType? userType;
  final String? email;
  final String? phoneNo;
  final String? userId;
  final String? name;
  final Status? status;
  final String? username;
  final String? firstname;
  final String? lastname;

  LoginModel({
    required this.message,
    required this.token,
    required this.userType,
    required this.email,
    required this.phoneNo,
    required this.userId,
    required this.name,
    required this.status,
    required this.username,
    required this.firstname,
    required this.lastname,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    message: json["message"],
    token: json["token"],
    userType: UserTypeExtension.fromString(json["userType"]),
    email: json["email"],
    phoneNo: json["phone"],
    userId: json["userId"],
    name: json["name"],
    status: StatusExtension.fromString(json["status"]),
    username: json["username"],
    firstname: json["firstName"],
    lastname: json["lastName"],
  );


  Map<String, dynamic> toJson() => {
    "message": message,
    "token": token,
    "userType": userType?.name,
    "email": email,
    "phoneNo": phoneNo,
    "userId": userId,
    "name": name,
    "status": status?.name,
    "username": username,
    "firstname": firstname,
    "lastname": lastname,
  };

}
