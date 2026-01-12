import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:artsays_app/signup/widget/signup_container.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 246,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 46),
            child: Image.asset(
              ImageAssetConstant.computerImage,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
      ),

      bottomSheet: SignupContainer(),
    );
  }
}
