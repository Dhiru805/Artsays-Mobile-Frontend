import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:artsays_app/constants/string_constant.dart';
import 'package:artsays_app/login/login.dart';
import 'package:artsays_app/shared/widgets/my_button.dart';
import 'package:artsays_app/signup/screen/artist_seller_screen.dart';
import 'package:artsays_app/signup/widget/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupContainer extends StatelessWidget {
  const SignupContainer({super.key});

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
            SizedBox(height: 20),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: GoogleFonts.poppins(
                  color: ColorConstant.white,
                  fontSize: 14,
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
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: ColorConstant.white,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: MyTextfield(
                      text: 'First Name',
                      color: ColorConstant.white,
                      icon: Icons.person,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: MyTextfield(
                      text: 'Last Name',
                      color: ColorConstant.white,
                      icon: Icons.person,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: MyTextfield(
                text: 'Email/Phone Number',
                color: ColorConstant.white,
                icon: Icons.call,
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: MyTextfield(
                text: 'Password',
                color: ColorConstant.white,
                icon: Icons.lock,
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: MyTextfield(
                text: 'Confirm Password',
                color: ColorConstant.white,
                icon: Icons.lock,
              ),
            ),
            SizedBox(height: 24),
            SizedBox(
              height: 38,
              width: 160,
              child: MyButton(
                onpressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const SellerScreen(),
                  //   ),
                  // );
                },
                color: ColorConstant.orange,
                text: StringConstant.signup,
                textStyle: TextStyle(), //textStyle: GoogleFonts.poppins(
              ),
            ),
            SizedBox(height: 32),

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
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 10),
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
                    fontSize: 14,
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
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  ImageAssetConstant.facebookLogo,
                  height: 39,
                  width: 39,
                ),
                Image.asset(
                  ImageAssetConstant.googleLogo,
                  height: 39,
                  width: 39,
                ),
                Image.asset(
                  ImageAssetConstant.appleLogo,
                  height: 39,
                  width: 39,
                ),
              ],
            ),
            SizedBox(height: 12),

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
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
