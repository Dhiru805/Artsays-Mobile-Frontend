import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:artsays_app/onboard/screen/spalsh_screen2.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SplashScreen2()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 51.27,
              width: 175.85,
              child: Image.asset(
                ImageAssetConstant.logo,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "When Art Speaks, Value Grows",
            style: TextStyle(
              color: Color(0XFFFFFFFF),
              fontSize: 14,
              fontWeight: FontWeight.w500,
              //fontFamily: 'Montserrat',
            ),
          ),
        ],
      ),

      backgroundColor: ColorConstant.backgroundColor,
    );
  }
}
