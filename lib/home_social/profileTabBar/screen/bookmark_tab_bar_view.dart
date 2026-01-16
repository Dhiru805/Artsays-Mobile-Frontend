import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:artsays_app/home_social/profileTabBar/widget/custom_slider_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BookmarkTabBarView extends StatefulWidget {
  const BookmarkTabBarView({super.key});

  @override
  State<BookmarkTabBarView> createState() => _BookmarkTabBarViewState();
}

class _BookmarkTabBarViewState extends State<BookmarkTabBarView> {
  late double screenWidth;
  late double screenHeight;

  final List<String> imageAssets = [
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
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: screenWidth,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.025, // responsive 10px approx
                vertical: screenHeight * 0.006, // responsive 5px approx
              ),
              child: MasonryGridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: screenWidth * 0.008, // 3px approx
                mainAxisSpacing: screenHeight * 0.0025, // 2px approx
                itemCount: imageAssets.length,
                itemBuilder: (context, index) {
                  return Image.asset(imageAssets[index]);
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
          return CustomSliderContainer();
        },
      ),
    );
  }
}
