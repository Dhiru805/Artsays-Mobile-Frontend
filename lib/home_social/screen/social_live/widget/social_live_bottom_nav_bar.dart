// ignore_for_file: sort_child_properties_last, prefer_final_fields

import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/home_social/screen/social_live/social_live_deatail.dart';
import 'package:artsays_app/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SocialLiveBottomNavBar extends StatefulWidget {
  final String buttonText;
  const SocialLiveBottomNavBar({super.key, required this.buttonText});

  @override
  State<SocialLiveBottomNavBar> createState() => _SocialLiveBottomNavBarState();
}

class _SocialLiveBottomNavBarState extends State<SocialLiveBottomNavBar> {
  // int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // List<Widget> screen = [SocialLiveDeatail()];
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      appBar: CustomAppBar(
        onNotificationTap: () {},
        title: '',
        fontFamily: '',
        centerTitle: false,
      ),
      body: SocialLiveDeatail(),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Container(
          // height: 70,
          color: ColorConstant.backgroundColor,
          //padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    widget.buttonText,
                    style: TextStyle(
                      color: ColorConstant.backgroundColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 17,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              // GestureDetector(
              //   onTap: () {
              //     setState(() {
              //       _selectedIndex = 2; // index of SocialAddScreen
              //     });
              //   }, // this button is + icon in bottaom navigation bar//
              //   child: SizedBox(
              //     height: 70,
              //     width: 74.94,
              //     child: Image.asset(ImageAssetConstant.addNavBarImage),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
