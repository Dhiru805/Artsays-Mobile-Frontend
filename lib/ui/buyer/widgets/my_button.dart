import 'package:artsays_app/config/size_config.dart';
import 'package:artsays_app/constants/color_constant.dart';
import 'package:flutter/material.dart';

Widget myButton(
  String text,
  VoidCallback onPress,
  double screenHeight,
  double screenWidth, {
  IconData? icon,
  String? icon2,
}) {
  bool isIcon = true;
  if (icon2 != null) {
    isIcon = false;
  }
  return Expanded(
    child: Container(
      height: screenHeight * 0.045,
      decoration: BoxDecoration(
        color: ColorConstant.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isIcon
                ? Icon(
                    icon,
                    color: ColorConstant.orange,
                    size: SizeConfig.getFont(25),
                  )
                : Padding(
                    padding: EdgeInsets.only(bottom: 8, top: 8, left: 8, right: 0),
                    child: Image.asset(icon2!, width: 30, height: 30),
                  ),
            isIcon? SizedBox(width: screenWidth * 0.04): SizedBox(width: 0),
            Text(
              text,
              style: TextStyle(
                color: ColorConstant.black,
                fontSize: SizeConfig.getFont(16),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
