import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:artsays_app/home_social/profileTabBar/widget/custom_slider_container.dart';
import 'package:flutter/material.dart';

class SocialProfileArtistVideo extends StatefulWidget {
  const SocialProfileArtistVideo({super.key});

  @override
  State<SocialProfileArtistVideo> createState() =>
      _SocialProfileArtistVideoState();
}

class _SocialProfileArtistVideoState extends State<SocialProfileArtistVideo> {
  late double screenWidth;
  late double screenHeight;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            5,
            (_) => Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.004,
              ),
              child: _videoCard(),
            ),
          ),
        ),
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

  Widget _videoCard() {
    return Container(
      height: screenHeight * 0.10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.42),
        color: const Color(0xFFFEE2CC),
      ),
      padding: const EdgeInsets.only(right: 6.5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 7,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(screenWidth * 0.04),
                bottomLeft: Radius.circular(screenWidth * 0.04),
              ),
            ),
          ),
          const SizedBox(width: 3),
          Padding(
            padding: const EdgeInsets.only(top: 9.5),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: 140,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(5.42),
                  ),
                  child: Center(
                    child: Image.asset(
                      ImageAssetConstant.socialSearchVideoImg,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.8),
                  ),
                  child: Icon(
                    Icons.play_arrow_outlined,
                    color: ColorConstant.orange,
                    size: 30,
                  ),
                ),
                Positioned(
                  bottom: 6,
                  right: 6,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      '30:15',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 9.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Expanded(
                        child: Text(
                          'Lorem ipsum dolor sit amet',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.83,
                            color: Colors.black,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.more_horiz, size: 20),
                    ],
                  ),
                ),
                const Text(
                  '11M Views • Streamed 1w ago',
                  style: TextStyle(color: Colors.black, fontSize: 5.96),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Image.asset(ImageAssetConstant.profileImage),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'thatoneweirdo',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 7.58,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit adipiscing......',
                  style: TextStyle(color: Colors.black, fontSize: 5.96),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: ColorConstant.backgroundColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'New',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 6.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
