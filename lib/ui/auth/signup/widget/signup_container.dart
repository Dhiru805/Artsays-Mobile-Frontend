import 'package:artsays_app/config/size_config.dart';
import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/enums.dart';
import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:artsays_app/constants/string_constant.dart';
import 'package:artsays_app/ui/auth/login/login.dart';
import 'package:artsays_app/model/auth_models/otp_verification_model.dart';
import 'package:artsays_app/shared/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../services/api_services/auth_apis/auth_api_service.dart';
import '../screen/artist_seller_screen.dart';
import 'my_textfield.dart';

class SignupContainer extends StatefulWidget {
  const SignupContainer({super.key});

  @override
  State<SignupContainer> createState() => _SignupContainerState();
}

class _SignupContainerState extends State<SignupContainer> {
  bool showPassword = false;
  bool showConfirmPassword = false;
  bool verified = false, otpSent = false, isPhone = false, isEnabled = true;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: ColorConstant.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(62),
            topRight: Radius.circular(62),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.getHeight(20)),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: GoogleFonts.poppins(
                  color: ColorConstant.white,
                  fontSize: SizeConfig.getFont(14),
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(text: "New to Artsays?\n"),
                  TextSpan(text: "Join our creative world\n"),
                ],
              ),
            ),

            Text(
              "Create Account",
              style: GoogleFonts.poppins(
                fontSize: SizeConfig.getFont(25),
                fontWeight: FontWeight.w600,
                color: ColorConstant.white,
              ),
            ),
            SizedBox(height: SizeConfig.getHeight(20)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: MyTextfield(
                      text: 'First Name',
                      color: ColorConstant.white,
                      icon: Icons.person,
                      controller: firstNameController,
                    ),
                  ),
                  SizedBox(width: SizeConfig.getHeight(8)),
                  Expanded(
                    child: MyTextfield(
                      text: 'Last Name',
                      color: ColorConstant.white,
                      icon: Icons.person,
                      controller: lastNameController,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.getHeight(12)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: MyTextfield(
                text: 'Email/Phone Number',
                color: ColorConstant.white,
                icon: Icons.call,
                controller: emailController,
                isOtpVerification: true,
                buttonText: "Send OTP",
                isEnabled: isEnabled,
                onSendOtp: isEnabled
                    ? () async {
                        isPhone = isPhoneNumber(emailController.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("We are sending OTP please wait...!"),
                          ),
                        );
                        var res = await sendOtp(emailController.text, isPhone);
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
                        ).showSnackBar(SnackBar(content: Text(res.message)));
                      }
                    : () {},
              ),
            ),
            if (otpSent) ...[
              SizedBox(height: SizeConfig.getHeight(12)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: MyTextfield(
                  text: 'Enter OTP',
                  color: ColorConstant.white,
                  icon: Icons.password,
                  isEnabled: isEnabled,
                  buttonText: "Verify OTP",
                  isOtp: true,
                  controller: otpController,
                  isOtpVerification: true,
                  onSendOtp: isEnabled
                      ? () async {
                          var res = await verifyOtp(
                            emailController.text,
                            otpController.text,
                            isPhone,
                          );
                          if (res.success == null) {
                            verified = false;
                          }
                          if (res.success == "true") {
                            verified = true;
                            setState(() {
                              isEnabled = false;
                            });
                          }
                          if (!context.mounted) return;
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(res.message)));
                        }
                      : () {},
                ),
              ),
            ],
            SizedBox(height: SizeConfig.getHeight(12)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: MyTextfield(
                text: 'Password',
                color: ColorConstant.white,
                icon: Icons.lock,
                controller: passwordController,
                isPassword: true,
                showPassword: showPassword,
                onVisibilityTap: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
              ),
            ),
            SizedBox(height: SizeConfig.getHeight(12)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: MyTextfield(
                text: 'Confirm Password',
                color: ColorConstant.white,
                icon: Icons.lock,
                controller: confirmPasswordController,
                isPassword: true,
                showPassword: showConfirmPassword,
                onVisibilityTap: () {
                  setState(() {
                    showConfirmPassword = !showConfirmPassword;
                  });
                },
              ),
            ),
            SizedBox(height: SizeConfig.getHeight(24)),
            SizedBox(
              height: SizeConfig.getHeight(38),
              width: SizeConfig.getWidth(160),
              child: MyButton(
                onpressed: () async {
                  if (!verified) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please verify email/phone first"),
                      ),
                    );
                  }

                  /// Success Response of registration
                  /// {
                  /// "success":true,
                  /// "message":"Buyer account created successfully",
                  /// "user":
                  /// {
                  /// "id":"696b48cefd2ddd6349bbeed1",
                  /// "name":"Dev",
                  /// "email":"devmtamakuwala2424@gmail.com",
                  /// "userType":"Buyer",
                  /// "role":"buyer",
                  /// "status":"Unverified"
                  /// }
                  /// }
                  String userType = UserType.Buyer.name;
                  String firstName = firstNameController.text;
                  String lastName = lastNameController.text;
                  String email = emailController.text;
                  String phone = emailController.text;
                  String password = passwordController.text;
                  String confirmPassword = confirmPasswordController.text;
                  String role = userType.toLowerCase();
                  // bool numberVerified = verified;

                  OtpVerificationModel res;
                  if (isPhone) {
                    res = await register(
                      firstName: firstName,
                      lastName: lastName,
                      password: password,
                      confirmPassword: confirmPassword,
                      userType: userType,
                      role: role,
                      isPhone: isPhone,
                      phone: phone,
                      numberVerified: verified,
                    );
                  } else {
                    res = await register(
                      firstName: firstName,
                      lastName: lastName,
                      email: email,
                      password: password,
                      confirmPassword: confirmPassword,
                      userType: userType,
                      role: role,
                      isPhone: isPhone,
                      emailVerified: verified,
                    );
                  }
                  if(!context.mounted) return;
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(res.message)));
                },
                color: ColorConstant.orange,
                text: StringConstant.signup,
                textStyle: TextStyle(), //textStyle: GoogleFonts.poppins(
              ),
            ),
            SizedBox(height: SizeConfig.getHeight(32)),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SellerScreen()),
                );
              },
              child: Text(
                "Are You an Artist or Seller?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.getFont(18),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.getHeight(10)),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: ColorConstant.white,
                    thickness: 1,
                    endIndent: 10,
                  ),
                ),
                Text(
                  "or login with",
                  style: GoogleFonts.poppins(
                    fontSize: SizeConfig.getFont(14),
                    fontWeight: FontWeight.w400,
                    color: ColorConstant.white,
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: ColorConstant.white,
                    thickness: 1,
                    indent: 10,
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.getHeight(15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  ImageAssetConstant.facebookLogo,
                  height: SizeConfig.getHeight(39),
                  width: SizeConfig.getWidth(39),
                ),
                Image.asset(
                  ImageAssetConstant.googleLogo,
                  height: SizeConfig.getHeight(39),
                  width: SizeConfig.getWidth(39),
                ),
                Image.asset(
                  ImageAssetConstant.appleLogo,
                  height: SizeConfig.getHeight(39),
                  width: SizeConfig.getWidth(39),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.getHeight(12)),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text(
                "Already have an account?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.getFont(14),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: SizeConfig.getHeight(20)),
          ],
        ),
      ),
    );
  }
}

/// Email or phoner number checking
bool isEmail(String input) {
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegex.hasMatch(input);
}

bool isPhoneNumber(String input) {
  final phoneRegex = RegExp(r'^[0-9]{10}$');
  return phoneRegex.hasMatch(input);
}
