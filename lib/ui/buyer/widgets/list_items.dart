import 'package:flutter/material.dart';

Widget listItem(
  String title,
  int index,
  double screenWidth,
  double screenHeight,
  VoidCallback onTap,
) {
  bool isEven = index % 2 == 0;

  return Container(
    decoration: BoxDecoration(
      color: isEven ? Colors.transparent : const Color(0x8BEFEEEE),
      borderRadius: BorderRadius.circular(screenWidth * 0.02),
    ),
    margin: EdgeInsets.symmetric(
      horizontal: screenWidth * 0.03,
      vertical: screenHeight * 0.001,
    ),
    child: ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: screenWidth * 0.037,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: screenWidth * 0.05,
        color: Colors.black,
      ),
      onTap: onTap,
    ),
  );
}
