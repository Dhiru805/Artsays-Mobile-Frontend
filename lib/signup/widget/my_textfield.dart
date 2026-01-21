import 'package:artsays_app/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/color_constant.dart';

class MyTextfield extends StatefulWidget {
  final String text;
  final String? buttonText;
  final Color color;
  final IconData icon;
  final bool isPassword;
  final bool isOtpVerification;
  final bool showPassword;
  final bool isOtp;
  final isEnabled;
  final VoidCallback? onVisibilityTap;
  final TextEditingController controller;
  final VoidCallback? onSendOtp;

  const MyTextfield({
    super.key,
    required this.text,
    required this.color,
    required this.icon,
    required this.controller,
    this.isPassword = false,
    this.showPassword = false,
    this.onVisibilityTap,
    this.isOtpVerification = false,
    this.onSendOtp,
    this.buttonText,
    this.isOtp = false,
    this.isEnabled = true,
  });

  @override
  State<MyTextfield> createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
  bool showOtpButton = false;
  bool showOtpVerifyButton = false;

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      final text = widget.controller.text.trim();

      bool shouldShow = false;

      // Case 1: Send OTP button (email / phone)
      if (widget.isOtpVerification && !widget.isOtp) {
        shouldShow = text.isNotEmpty;
      }

      // Case 2: Verify OTP button (OTP input)
      if (widget.isOtpVerification && widget.isOtp) {
        setState(() {
          showOtpVerifyButton = showOtpButton =
              text.length == 6; // or >= 4 if your OTP is shorter
        });
      }

      if (shouldShow != showOtpButton) {
        setState(() {
          showOtpButton = shouldShow;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.isPassword && !widget.showPassword,
      style: GoogleFonts.montserrat(
        color: widget.color,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      cursorColor: widget.color,
      keyboardType: widget.isOtp ? TextInputType.number : TextInputType.text,
      maxLength: widget.isOtp ? 6 : null,
      buildCounter:
          (_, {required currentLength, maxLength, required isFocused}) => null,
      enabled: widget.isEnabled,
      decoration: InputDecoration(
        hintText: widget.text,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Icon(widget.icon, color: widget.color),
        ),
        hintStyle: GoogleFonts.montserrat(
          color: widget.color,
          fontSize: SizeConfig.getFont(15),
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: widget.onVisibilityTap,
                icon: Icon(
                  widget.showPassword ? Icons.visibility_off : Icons.visibility,
                  color: widget.color,
                ),
              )
            : widget.isOtpVerification && showOtpButton || widget.isOtp
            ? Padding(
                padding: EdgeInsets.all(6),
                child: ElevatedButton(
                  onPressed: widget.onSendOtp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstant.orange,
                    // theme color
                    foregroundColor: Colors.white,
                    // text color
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    minimumSize: const Size(0, 32),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    widget.buttonText!,
                    style: TextStyle(fontSize: SizeConfig.getFont(15)),
                  ),
                ),
              )
            : null,
        prefixIconConstraints: BoxConstraints(
          minWidth: 24,
          minHeight: 20,
          maxHeight: 20,
          maxWidth: 24,
        ),
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: widget.color),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: widget.color),
        ),
      ),
    );
  }
}
