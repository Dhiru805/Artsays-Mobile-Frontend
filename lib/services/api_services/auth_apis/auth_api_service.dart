import 'dart:convert';

import 'package:artsays_app/constants/credentials/api_base_url.dart';
import 'package:artsays_app/model/auth_models/login_model.dart';
import 'package:artsays_app/model/auth_models/otp_verification_model.dart';
import 'package:http/http.dart' as http;

/// Login API
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

/// Registration API
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
  if (userType.toLowerCase() == "artist") {
    if (isPhone) {
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
  } else if (userType.toLowerCase() == "buyer") {
    if (isPhone) {
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
    if (isPhone) {
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

/// Send OTP API
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

/// Verify OTP API
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

/// Send OTP for forgot password API
Future<OtpVerificationModel> sendOtpForResetPassword(String email) async {
  String apiUrl = "$apiBaseUrl/api/createotp";

  final http.Response response;

  response = await http.post(
    Uri.parse(apiUrl),
    // headers: {"Content-Type": "application/json"},
    body: {"email": email},
  );

  return otpVerificationModelJson(response.body);
}

/// Verify OTP for forgot password API
Future<OtpVerificationModel> verifyOtpForForgotPassword(
  String email,
  String otp,
) async {
  String apiUrl = "$apiBaseUrl/api/verifyotp";

  final http.Response response;

  response = await http.post(
    Uri.parse(apiUrl),
    // headers: {"Content-Type": "application/json"},
    body: {"email": email, "otp": otp},
  );

  return otpVerificationModelJson(response.body);
}

/// Forgot Password API
Future<OtpVerificationModel> forgotPassword({
  required String token,
  required String newPassword,
  required String otp,
  required String email,
}) async {
  String apiUrl = "$apiBaseUrl/api/resetpassword";
  print(otp);
  print(newPassword);
  print(email);
  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      "Content-Type": "application/json",
      "Authentication": 'Barer $token',
    },
    body: jsonEncode({"email": email, "otp": otp, "newPassword": newPassword}),
  );

  return otpVerificationModelJson(response.body);
}
