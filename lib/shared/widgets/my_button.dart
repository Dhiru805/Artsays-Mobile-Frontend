import 'package:artsays_app/constants/color_constant.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function() onpressed;
  final Color color;
  final String text;
  final TextStyle textStyle;
  // final String textColor;

  const MyButton({
    super.key,
    required this.onpressed,
    required this.color,
    required this.text,
    required this.textStyle, //required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
