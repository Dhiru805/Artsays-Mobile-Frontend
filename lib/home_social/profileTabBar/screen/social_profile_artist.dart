import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:artsays_app/home_social/profileTabBar/widget/custom_slider_container_social_profile_artist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SocialProfileArtist extends StatefulWidget {
  const SocialProfileArtist({super.key});

  @override
  State<SocialProfileArtist> createState() =>
      _SocialProfileUserMyAccountState();
}

class _SocialProfileUserMyAccountState extends State<SocialProfileArtist> {
  late double screenwidth;
  late double screenHeight;

  final List<String> iamgeAssets = [
    ImageAssetConstant.waterBoat,
    ImageAssetConstant.fieldBoat,
    ImageAssetConstant.grassField,
    ImageAssetConstant.waterBoat,
    ImageAssetConstant.fieldBoat,
    ImageAssetConstant.grassField,
    ImageAssetConstant.waterBoat,
    ImageAssetConstant.fieldBoat,
    ImageAssetConstant.grassField,
    ImageAssetConstant.waterBoat,
    ImageAssetConstant.fieldBoat,
    ImageAssetConstant.grassField,
  ];
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: screenwidth,
            color: Colors.white,

            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenwidth * 0.025, // responsive 10px approx
                vertical: screenHeight * 0.006,
              ),
              child: MasonryGridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: screenwidth * 0.008, // 3px approx
                mainAxisSpacing: screenHeight * 0.0025, // 2px approx

                itemCount: iamgeAssets.length,
                itemBuilder: (context, index) {
                  return Image.asset(iamgeAssets[index]);
                },
              ),
            ),
          ),
        ],
      ),

      bottomSheet: BottomSheet(
        shadowColor: Colors.transparent,
        dragHandleColor: Colors.transparent,
        onClosing: () {},
        backgroundColor: Colors.transparent,
        builder: (context) {
          return CustomSliderContainerSocialProfileArtist();
        },
      ),
    );
  }
}
