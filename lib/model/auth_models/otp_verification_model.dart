import 'dart:convert';

OtpVerificationModel otpVerificationModelJson(String str) =>
    OtpVerificationModel.fromJson(json.decode(str));

class OtpVerificationModel {
  final String? success;
  final String message;

  OtpVerificationModel({required this.success, required this.message});

  factory OtpVerificationModel.fromJson(Map<String, dynamic> json) =>
      OtpVerificationModel(
        success: json["success"].toString(),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {"message": message, "success": success};
}
