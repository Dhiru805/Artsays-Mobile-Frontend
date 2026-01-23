import 'package:artsays_app/model/auth_models/otp_verification_model.dart';
import 'package:artsays_app/ui/auth/reset_password/widgets/change_password_text_fields.dart';
import 'package:artsays_app/ui/common/popups/custom_toast.dart';
import 'package:flutter/material.dart';

import '../../../config/size_config.dart';
import '../../../constants/color_constant.dart';
import '../../../constants/image_asset_constant.dart';
import '../../../constants/string_constant.dart';
import '../../../services/api_services/auth_apis/auth_api_service.dart';
import '../../../services/local_data_storage_service.dart';
import '../../../shared/widgets/my_button.dart';

class PasswordChange extends StatefulWidget {
  const PasswordChange({super.key});

  @override
  State<PasswordChange> createState() => _PasswordChangeState();
}

class _PasswordChangeState extends State<PasswordChange> {
  TextEditingController emailController = TextEditingController(
    text: "techcom1624@gmail.com",
  );
  TextEditingController passwordController = TextEditingController(
    text: '123456789',
  );

  final TextEditingController otpController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();

  bool showPassword = false;

  bool showSendOtpButton = false;

  bool showConfirmPassword = false, showNewPasswordFields = false;
  bool verified = false, otpSent = false, isPhone = false, isEnabled = true;

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      final text = emailController.text.trim();

      bool shouldShow = false;

      shouldShow = text.isNotEmpty;

      if (shouldShow != showSendOtpButton) {
        setState(() {
          showSendOtpButton = shouldShow;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    otpController.dispose();
    confirmNewPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final keyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          // Background scroll
          SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: SizeConfig.getHeight(65)),
                  child: Image.asset(
                    ImageAssetConstant.loginImage,
                    height: SizeConfig.getHeight(316),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: SizeConfig.getHeight(400)),
                // space for bottom container
              ],
            ),
          ),

          // Bottom container
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: SizeConfig.getHeight(40),
                bottom: SizeConfig.getHeight(30),
              ),
              decoration: const BoxDecoration(
                color: ColorConstant.backgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(62),
                  topRight: Radius.circular(62),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, -3),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Forgot password",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.getFont(25),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: SizeConfig.getHeight(20)),

                  if (!showNewPasswordFields) ...[
                    SizedBox(
                      height: SizeConfig.getWidth(35),
                      width: SizeConfig.getWidth(390),
                      child: TextField(
                        controller: emailController,
                        enabled: isEnabled,
                        style: TextStyle(color: ColorConstant.white),
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(
                              left: SizeConfig.getWidth(20),
                            ),
                            child: Icon(Icons.call, color: ColorConstant.white),
                          ),
                          hintText: "Email/Phone Number",
                          hintStyle: TextStyle(
                            color: ColorConstant.white,
                            fontSize: SizeConfig.getFont(16),
                            fontWeight: FontWeight.w500,
                          ),
                          suffixIcon: showSendOtpButton
                              ? Padding(
                                  padding: EdgeInsets.all(6),
                                  child: ElevatedButton(
                                    onPressed: isEnabled
                                        ? () async {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  "We are sending OTP please wait...!",
                                                ),
                                              ),
                                            );
                                            var res = await sendOtpForResetPassword(
                                              emailController.text,
                                            );
                                            setState(() {
                                              if (res.success == null) {
                                                otpSent = false;
                                              }
                                              if (res.success == "true") {
                                                otpSent = true;
                                              }
                                            });
                                            if (!context.mounted) return;
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(res.message),
                                              ),
                                            );
                                          }
                                        : () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: ColorConstant.orange,
                                      // theme color
                                      foregroundColor: Colors.white,
                                      // text color
                                      elevation: 0,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 0,
                                      ),
                                      minimumSize: const Size(0, 32),
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                    child: Text(
                                      "Send OTP",
                                      style: TextStyle(
                                        color: ColorConstant.white,
                                        fontSize: SizeConfig.getFont(15),
                                      ),
                                    ),
                                  ),
                                )
                              : null,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: ColorConstant.white,
                              width: SizeConfig.getWidth(1),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: ColorConstant.white,
                              width: SizeConfig.getWidth(1),
                            ),
                          ),
                        ),
                      ),
                    ),

                    /// OTP verification button
                    if (otpSent) ...[
                      SizedBox(height: SizeConfig.getHeight(8)),
                      SizedBox(
                        height: SizeConfig.getWidth(35),
                        width: SizeConfig.getWidth(390),
                        child: TextField(
                          controller: otpController,
                          enabled: isEnabled,
                          style: TextStyle(color: ColorConstant.white),
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(
                                left: SizeConfig.getWidth(20),
                              ),
                              child: Icon(
                                Icons.password,
                                color: ColorConstant.white,
                              ),
                            ),
                            hintText: "Enter OTP",
                            hintStyle: TextStyle(
                              color: ColorConstant.white,
                              fontSize: SizeConfig.getFont(16),
                              fontWeight: FontWeight.w500,
                            ),
                            suffixIcon: showSendOtpButton
                                ? Padding(
                                    padding: EdgeInsets.all(6),
                                    child: ElevatedButton(
                                      onPressed: isEnabled
                                          ? () async {
                                              var res = await verifyOtpForForgotPassword(
                                                emailController.text,
                                                otpController.text,
                                              );
                                              if (res.success == null) {
                                                verified = false;
                                              }
                                              if (res.success == "true") {
                                                verified = true;
                                                setState(() {
                                                  isEnabled = false;
                                                  showNewPasswordFields = true;
                                                });
                                              }
                                              if (!context.mounted) return;
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                SnackBar(
                                                  content: Text(res.message),
                                                ),
                                              );
                                            }
                                          : () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: ColorConstant.orange,
                                        // theme color
                                        foregroundColor: Colors.white,
                                        // text color
                                        elevation: 0,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 0,
                                        ),
                                        minimumSize: const Size(0, 32),
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        "Verify OTP",
                                        style: TextStyle(
                                          color: ColorConstant.white,
                                          fontSize: SizeConfig.getFont(15),
                                        ),
                                      ),
                                    ),
                                  )
                                : null,
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: ColorConstant.grey,
                                width: SizeConfig.getWidth(1),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: ColorConstant.grey,
                                width: SizeConfig.getWidth(1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],

                  if (showNewPasswordFields) ...[
                    changePasswordTextFields(
                      newPassword: newPasswordController,
                      confirmPassword: confirmNewPasswordController,
                      otp: otpController.text,
                      showPassword: showPassword,
                      showConfirmPassword: showConfirmPassword,
                      showConfirmPasswordOnPress: () {
                        setState(() {
                          showConfirmPassword = !showConfirmPassword;
                        });
                      },
                      showPasswordOnPress: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                    ),
                  ],

                  SizedBox(height: SizeConfig.getHeight(30)),

                  SizedBox(
                    height: SizeConfig.getHeight(45),
                    width: SizeConfig.getWidth(200),
                    child: MyButton(
                      onpressed: showNewPasswordFields
                          ? () async {
                        String? token = await getAuthToken();
                        String newPassword = newPasswordController.text;
                        String otp = otpController.text;
                        String email = emailController.text;

                              OtpVerificationModel ofm = await forgotPassword(
                                token: token!,
                                newPassword: newPassword,
                                otp: otp,
                                email: email,
                              );

                              if (!context.mounted) return;
                              customToast(message: ofm.message, context: context);

                              if(ofm.success == 'true'){
                                Navigator.pop(context);
                              }
                            }
                          : () {},
                      color: ColorConstant.orange,
                      text: StringConstant.changePassword,
                      textStyle: TextStyle(
                        color: ColorConstant.white,
                        fontWeight: FontWeight.normal,
                        fontSize: SizeConfig.getFont(16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

bool isPhoneNumber(String input) {
  final phoneRegex = RegExp(r'^[0-9]{10}$');
  return phoneRegex.hasMatch(input);
}
