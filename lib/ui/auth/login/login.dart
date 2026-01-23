import 'package:artsays_app/config/size_config.dart';
import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/enums.dart';
import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:artsays_app/constants/string_constant.dart';
import 'package:artsays_app/ui/auth/reset_password/password_change.dart';
import 'package:artsays_app/ui/common/popups/custom_toast.dart';
import 'package:artsays_app/shared/widgets/my_button.dart';
import 'package:artsays_app/ui/auth/signup/screen/signup_screen.dart';
import 'package:artsays_app/ui/auth/signup/widget/signup_container.dart';
import 'package:flutter/material.dart';

import '../../../model/auth_models/login_model.dart';
import '../../../services/api_services/auth_apis/auth_api_service.dart';
import '../../../services/local_data_storage_service.dart';
import '../../buyer/community/screens/buyer_bottom_nav_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(
    text: "kobet69491@discounp.com",
  );
  TextEditingController passwordController = TextEditingController(text: '123456789');

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    final keyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        reverse: true,
        child: IntrinsicHeight(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: SizeConfig.getHeight(65)),
                child: Image.asset(
                  ImageAssetConstant.loginImage,
                  height: SizeConfig.getHeight(316),
                  width: SizeConfig.getWidth(430),
                  fit: BoxFit.cover,
                ),
              ),

              /// Then Container
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                bottom: keyboardVisible ? 100 : 0,
                // move up when keyboard appears
                left: 0,
                right: 0,
                child: Container(
                  // Container(
                  width: SizeConfig.getWidth(500),
                  margin: EdgeInsets.only(top: SizeConfig.getHeight(50)),
                  padding: EdgeInsets.only(top: SizeConfig.getHeight(40)),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Your creativity, your space",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.getFont(14),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: SizeConfig.getHeight(20)),
                      Text(
                        "Log in to Continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.getFont(25),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: SizeConfig.getHeight(20)),
                      SizedBox(height: SizeConfig.getHeight(8)),
                      SizedBox(
                        height: SizeConfig.getHeight(35),
                        width: SizeConfig.getWidth(390),
                        child: TextField(
                          controller: emailController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Icon(
                                Icons.email,
                                color: ColorConstant.white,
                              ),
                            ),
                            hintText: "Email/Mobile Number",
                            hintStyle: TextStyle(
                              color: ColorConstant.white,
                              fontSize: SizeConfig.getFont(16),
                              fontWeight: FontWeight.w500,
                            ),
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

                      SizedBox(height: SizeConfig.getHeight(8)),
                      SizedBox(
                        height: SizeConfig.getHeight(35),
                        width: SizeConfig.getWidth(390),
                        child: TextField(
                          controller: passwordController,
                          obscureText: !showPassword,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Icon(
                                Icons.lock,
                                color: ColorConstant.white,
                              ),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              icon: showPassword
                                  ? Icon(Icons.visibility, color: Colors.white)
                                  : Icon(
                                      Icons.visibility_off,
                                      color: Colors.white,
                                    ),
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: ColorConstant.white,
                              fontSize: SizeConfig.getFont(16),
                              fontWeight: FontWeight.w500,
                            ),
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

                      SizedBox(height: SizeConfig.getWidth(10)),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PasswordChange(),
                                ),
                              );
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.getFont(15),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: SizeConfig.getHeight(40)),
                      SizedBox(
                        height: SizeConfig.getHeight(45),
                        width: SizeConfig.getWidth(160),
                        child: MyButton(
                          onpressed: () async {
                            // aloksuper333@gmail.com
                            await setEarlierLogin(true);
                            String email = emailController.text;
                            String password = passwordController.text;

                            LoginModel lm = await login(email, password);
                            if (lm.userType != null) {
                              await saveEmailOrPhone(email);
                              await savePassword(password);
                              await saveAuthToken(lm.token);
                              await saveUserID(lm.userId);
                              await saveUserType(lm.userType!.name);
                              if (!context.mounted) return;

                              if (lm.userType == UserType.Buyer) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BuyerBottomNavBar(),
                                  ),
                                );
                              } else if (lm.userType == UserType.Seller) {
                                customToast(
                                  message: "Seller",
                                  context: context,
                                );
                              } else if (lm.userType == UserType.Artist) {
                                customToast(
                                  message: "Artist",
                                  context: context,
                                );
                              } else {
                                customToast(
                                  message: "User have no permission to access the app",
                                  context: context,
                                );
                              }
                            } else {
                              if (!context.mounted) return;
                              customToast(
                                message: lm.message,
                                context: context,
                              );
                            }
                          },
                          color: ColorConstant.orange,
                          text: StringConstant.login,
                          textStyle: TextStyle(
                            color: ColorConstant.white,
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.getFont(18),
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.getHeight(40)),
                      Row(
                        children: <Widget>[
                          const Expanded(
                            child: Divider(
                              color: Colors.white,
                              thickness: 1,
                              indent: 0,
                              endIndent: 20,
                            ),
                          ),
                          Text(
                            "Or Login With",
                            style: TextStyle(
                              fontSize: SizeConfig.getFont(14),
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          const Expanded(
                            child: Divider(
                              color: Colors.white,
                              thickness: 1,
                              indent: 20,
                              endIndent: 0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.getHeight(20)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            ImageAssetConstant.facebookLogo,
                            height: SizeConfig.getHeight(39),

                            width: SizeConfig.getWidth(39),
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            ImageAssetConstant.googleLogo,
                            height: SizeConfig.getHeight(30),

                            width: SizeConfig.getWidth(30),
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            ImageAssetConstant.appleLogo,
                            height: SizeConfig.getHeight(39),

                            width: SizeConfig.getWidth(39),
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.getHeight(10)),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupScreen(),
                            ),
                          );
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => SignupContainer(),
                          //   ),
                          // );
                        },
                        child: Text(
                          "Don’t have an account yet?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: SizeConfig.getFont(18),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.getHeight(35)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
