import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/svg_asset_constant.dart';
import 'package:artsays_app/home_social/screen/social_live/social_live_deatail.dart';
import 'package:artsays_app/home_social/widget/social_bottom_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/size_config.dart';

class SocialAddScreen extends StatelessWidget {
  final VoidCallback onCreatePostTap;

  const SocialAddScreen({super.key, required this.onCreatePostTap});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final screenHeight = SizeConfig.screenHeight;
    final screenWidth = SizeConfig.screenWidth;

    return Scaffold(
      body: Stack(
        children: [
          Container(color: ColorConstant.backgroundColor),

          Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(screenWidth * 0.07),
                      topRight: Radius.circular(screenWidth * 0.07),
                    ),
                    color: const Color.fromARGB(
                      255,
                      235,
                      217,
                      217,
                    ).withValues(alpha: 0.3),
                  ),
                  width: double.infinity,
                  child: const SizedBox.shrink(),
                ),
              ),
            ],
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              child: Container(
                color: ColorConstant.backgroundColor,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.02,
                    bottom: screenHeight * 0.02,
                    left: screenWidth * 0.03,
                    right: screenWidth * 0.03,
                  ),
                  child: SocialBottomAnimation(
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: onCreatePostTap,

                            icon: SvgPicture.asset(
                              SvgImageAssetConstant.createPostImg,
                              height: screenHeight * 0.04,
                              width: screenWidth * 0.08,
                            ),
                            label: Text(
                              "Create post",
                              style: TextStyle(
                                color: ColorConstant.backgroundColor,
                                fontSize: screenWidth * 0.03,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.004,
                                horizontal: screenWidth * 0.004,
                              ),
                              backgroundColor: ColorConstant.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  screenWidth * 0.03,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.04),

                        // Go Live Button
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SocialLiveDeatail(),
                                ),
                              );
                            },
                            icon: SvgPicture.asset(
                              SvgImageAssetConstant.goLiveImg,
                              height: screenHeight * 0.04,
                              width: screenWidth * 0.08,
                            ),
                            label: Text(
                              "Go Live",
                              style: TextStyle(
                                color: ColorConstant.backgroundColor,
                                fontSize: screenWidth * 0.03,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                vertical: screenHeight * 0.004,
                                horizontal: screenWidth * 0.004,
                              ),
                              backgroundColor: ColorConstant.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  screenWidth * 0.03,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
