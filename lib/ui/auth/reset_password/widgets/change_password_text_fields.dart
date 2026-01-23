import 'package:flutter/material.dart';

import '../../../../config/size_config.dart';
import '../../../../constants/color_constant.dart';

Widget changePasswordTextFields({
  required TextEditingController newPassword,
  required TextEditingController confirmPassword,
  required String otp,
  required bool showPassword,
  required bool showConfirmPassword,
  required VoidCallback showPasswordOnPress,
  required VoidCallback showConfirmPasswordOnPress,
}) {
  return Column(
    children: [
      SizedBox(
        height: SizeConfig.getWidth(35),
        width: SizeConfig.getWidth(390),
        child: TextField(
          obscureText: !showPassword,
          controller: newPassword,
          style: TextStyle(color: ColorConstant.white),
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: SizeConfig.getWidth(20)),
              child: Icon(Icons.password, color: ColorConstant.white),
            ),
            hintText: "Enter new password",
            hintStyle: TextStyle(
              color: ColorConstant.white,
              fontSize: SizeConfig.getFont(16),
              fontWeight: FontWeight.w500,
            ),
            suffixIcon: showPassword
                ? IconButton(
                    onPressed: showPasswordOnPress,
                    icon: Icon(
                      Icons.visibility_off,
                      color: ColorConstant.white,
                    ),
                  )
                : IconButton(
                    onPressed: showPasswordOnPress,
                    icon: Icon(Icons.visibility, color: ColorConstant.white),
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
        height: SizeConfig.getWidth(35),
        width: SizeConfig.getWidth(390),
        child: TextField(
          obscureText: !showConfirmPassword,
          controller: confirmPassword,
          style: TextStyle(color: ColorConstant.white),
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: EdgeInsets.only(left: SizeConfig.getWidth(20)),
              child: Icon(Icons.password, color: ColorConstant.white),
            ),
            hintText: "Reenter new password",
            hintStyle: TextStyle(
              color: ColorConstant.white,
              fontSize: SizeConfig.getFont(16),
              fontWeight: FontWeight.w500,
            ),
            suffixIcon: showPassword
                ? IconButton(
              onPressed: showConfirmPasswordOnPress,
              icon: Icon(
                Icons.visibility_off,
                color: ColorConstant.white,
              ),
            )
                : IconButton(
              onPressed: showConfirmPasswordOnPress,
              icon: Icon(Icons.visibility, color: ColorConstant.white),
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
    ],
  );
}
