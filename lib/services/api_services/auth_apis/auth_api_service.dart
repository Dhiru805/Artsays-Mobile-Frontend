import 'dart:convert';

import 'package:artsays_app/constants/credentials/api_base_url.dart';
import 'package:artsays_app/model/auth_models/login_model.dart';
import 'package:artsays_app/model/auth_models/otp_verification_model.dart';
import 'package:http/http.dart' as http;

Future<LoginModel> login(String email, String password) async {
  String apiUrl = "$apiBaseUrl/auth/login";

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({"emailOrPhone": email, "password": password}),
  );

  if (response.statusCode == 200) {
    LoginModel lm = loginModelFromJson(response.body);
    return lm;
  } else {
    LoginModel lm = loginModelFromJson(response.body);
    return lm;
  }
}

Future<OtpVerificationModel> register({
  required String firstName,
  required String lastName,
  String? email,
  String? phone,
  String? artistName,
  String? businessName,
  required String password,
  required String confirmPassword,
  required String userType,
  required String role,
  bool? emailVerified,
  bool? numberVerified,
  required bool isPhone,
}) async {
  String apiUrl = "$apiBaseUrl/auth/createuser";

  final http.Response response;
  if(userType.toLowerCase() == "artist") {
    if(isPhone){
      response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "firstName": firstName,
          "lastName": lastName,
          "phone": phone,
          "artistName": artistName,
          "password": password,
          "confirmPassword": confirmPassword,
          "userType": userType,
          "role": role,
          "numberVerified": numberVerified,
          "status": "Unverified",
        }),
      );
    } else {
      response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "artistName": artistName,
          "password": password,
          "confirmPassword": confirmPassword,
          "userType": userType,
          "role": role,
          "emailVerified": emailVerified,
          "status": "Unverified",
        }),
      );
    }
  } else if(userType.toLowerCase() == "buyer"){
    if(isPhone){
      response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "firstName": firstName,
          "lastName": lastName,
          "phone": phone,
          "password": password,
          "confirmPassword": confirmPassword,
          "userType": userType,
          "role": role,
          "numberVerified": numberVerified,
          "status": "Unverified",
        }),
      );
    } else {
      response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword,
          "userType": userType,
          "role": role,
          "emailVerified": emailVerified,
          "status": "Unverified",
        }),
      );
    }
  } else {
    if(isPhone){
      response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "firstName": firstName,
          "lastName": lastName,
          "phone": phone,
          "businessName": businessName,
          "password": password,
          "confirmPassword": confirmPassword,
          "userType": userType,
          "role": role,
          "numberVerified": numberVerified,
          "status": "Unverified",
        }),
      );
    } else {
      response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "businessName": businessName,
          "password": password,
          "confirmPassword": confirmPassword,
          "userType": userType,
          "role": role,
          "emailVerified": emailVerified,
          "status": "Unverified",
        }),
      );
    }
  }
  return otpVerificationModelJson(response.body);
}

Future<OtpVerificationModel> sendOtp(String email, bool isPhone) async {
  String apiUrl = "$apiBaseUrl/auth/send-otp";

  final http.Response response;
  if (isPhone) {
    response = await http.post(
      Uri.parse(apiUrl),
      // headers: {"Content-Type": "application/json"},
      body: {"phone": email},
    );
  } else {
    response = await http.post(
      Uri.parse(apiUrl),
      // headers: {"Content-Type": "application/json"},
      body: {"email": email},
    );
  }

  return otpVerificationModelJson(response.body);
}

Future<OtpVerificationModel> verifyOtp(
  String email,
  String otp,
  bool isPhone,
) async {
  String apiUrl = "$apiBaseUrl/auth/verify-otp";

  final http.Response response;

  if (isPhone) {
    response = await http.post(
      Uri.parse(apiUrl),
      // headers: {"Content-Type": "application/json"},
      body: {"phone": email, "otp": otp},
    );
  } else {
    response = await http.post(
      Uri.parse(apiUrl),
      // headers: {"Content-Type": "application/json"},
      body: {"email": email, "otp": otp},
    );
  }

  return otpVerificationModelJson(response.body);
}
