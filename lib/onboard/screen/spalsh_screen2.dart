import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:artsays_app/onboard/widget/bottom_container.dart';
import 'package:flutter/material.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
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
          SizedBox(height: 190),
        ],
      ),
      bottomSheet: BottomSheet(
        shadowColor: Colors.transparent,
        dragHandleColor: Colors.transparent,
        onClosing: () {},
        backgroundColor: Colors.transparent,
        builder: (context) {
          return BottomContainer();
        },
      ),
    );
  }
}
