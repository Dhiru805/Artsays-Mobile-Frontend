import 'package:artsays_app/config/size_config.dart';
import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:artsays_app/constants/string_constant.dart';
import 'package:artsays_app/shared/widgets/my_button.dart';
import 'package:artsays_app/shared/widgets/social_bottom_nav_bar.dart';
import 'package:artsays_app/signup/widget/signup_container.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                bottom: keyboardVisible
                    ? 100
                    : 0, // move up when keyboard appears
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

                      SizedBox(height: 8),
                      SizedBox(
                        height: SizeConfig.getHeight(35),
                        width: SizeConfig.getWidth(390),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Icon(
                                Icons.lock,
                                color: ColorConstant.white,
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
                                  builder: (context) => SignupContainer(),
                                ),
                              );
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.getFont(1),
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
                          onpressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const SocialBottomNavBar(),
                              ),
                            );
                          },
                          color: ColorConstant.orange,
                          text: StringConstant.login,
                          textStyle: TextStyle(
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
