import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:artsays_app/constants/svg_asset_constant.dart';
import 'package:artsays_app/home_social/widget/social_bottom_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/size_config.dart';

class SocialSearchScreen extends StatefulWidget {
  const SocialSearchScreen({super.key});

  @override
  State<SocialSearchScreen> createState() => _SocialSearchScreenState();
}

class _SocialSearchScreenState extends State<SocialSearchScreen>
    with SingleTickerProviderStateMixin {

  List<String> recentSearches = [
    "Modern Art",
    "Historic Art Collection",
    "Abstract Art",
    "Renaissance",
    "Impressionism",
  ];

  List<Map<String, String>> profileSearches = [
    {
      "name": "Anand Ghosh",
      "title": "Art Director at ACTM",
      "image": ImageAssetConstant.profileImage,
    },
    {
      "name": "Anand Ghosh",
      "title": "Art Director at ACTM",
      "image": ImageAssetConstant.profileImage,
    },
    {
      "name": "Anand Ghosh",
      "title": "Art Director at ACTM",
      "image": ImageAssetConstant.profileImage,
    },
    {
      "name": "Anand Ghosh",
      "title": "Art Director at ACTM",
      "image": ImageAssetConstant.profileImage,
    },
    {
      "name": "Anand Ghosh",
      "title": "Art Director at ACTM",
      "image": ImageAssetConstant.profileImage,
    },
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final screenHeight = SizeConfig.screenHeight;
    final screenWidth = SizeConfig.screenWidth;

    return Scaffold(
      // resizeToAvoidBottomInset: true,
      // appBar: CustomAppBar(
      backgroundColor: ColorConstant.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04,
              // vertical: screenHeight * 0.015,
            ),
            child: Container(
              height: screenHeight * 0.055,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(screenWidth * 0.05),
              ),
              child: Row(
                children: [
                  SizedBox(width: screenWidth * 0.03),
                  Icon(Icons.search, color: ColorConstant.backgroundColor),
                  SizedBox(width: screenWidth * 0.02),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "Search here",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.mic, color: ColorConstant.backgroundColor),
                  SizedBox(width: screenWidth * 0.02),
                  SvgPicture.asset(SvgImageAssetConstant.gallaryIcon),
                  SizedBox(width: screenWidth * 0.02),
                ],
              ),
            ),
          ),
          Expanded(
            child: SocialBottomAnimation(
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.01),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(screenWidth * 0.05),
                    topRight: Radius.circular(screenWidth * 0.05),
                  ),
                  child: Container(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      // Added to make content scrollable
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.04,
                          vertical: screenHeight * 0.015,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Recent",
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.045,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Clear",
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.015),
                            // Removed Flexible wrapper; GridView handles its own sizing with shrinkWrap
                            GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 5,
                                    crossAxisSpacing: screenWidth * 0.02,
                                    mainAxisSpacing: screenWidth * 0.02,
                                    childAspectRatio: 1.0,
                                  ),
                              itemCount: profileSearches.length,
                              itemBuilder: (context, index) {
                                return ProfileCard(
                                  name: profileSearches[index]['name']!,
                                  title: profileSearches[index]['title']!,
                                  image: profileSearches[index]['image']!,
                                  screenWidth: screenWidth,
                                  screenHeight: screenHeight,
                                );
                              },
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemCount: recentSearches.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          child: SvgPicture.asset(
                                            SvgImageAssetConstant
                                                .searchListIcon,
                                            width: screenWidth * 0.032,
                                            height: screenHeight * 0.018,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        SizedBox(width: screenWidth * 0.0005),
                                        Text(
                                          recentSearches[index],
                                          style: TextStyle(
                                            fontSize: screenWidth * 0.04,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.close,
                                      color: Colors.black,
                                      size: screenWidth * 0.05,
                                    ),
                                  ],
                                );
                              },
                            ),
                            // SizedBox(height: screenHeight * 0.01),
                            Divider(indent: 1),

                            Row(
                              children: [
                                Icon(
                                  Icons.trending_up,
                                  size: screenWidth * 0.07,
                                  color: Colors.black,
                                ),
                                SizedBox(width: screenWidth * 0.01),
                                Text(
                                  "Trending now",
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.045,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.015),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: screenWidth * 0.43,
                                  height: screenHeight * 0.12,
                                  decoration: BoxDecoration(
                                    color: ColorConstant.lightPink,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top:
                                                screenHeight *
                                                0.015, // Made responsive
                                            left:
                                                screenWidth *
                                                0.02, // Made responsive
                                          ),
                                          child: Image.asset(
                                            ImageAssetConstant
                                                .trendingImage, // replace with your image
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          left: 0,
                                          right: 0,
                                          child: Container(
                                            height: screenHeight * 0.008, // line thickness
                                            color: ColorConstant
                                                .backgroundColor, // line color
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // 🔹 Second image container
                                Container(
                                  width: screenWidth * 0.43,
                                  height: screenHeight * 0.12,
                                  decoration: BoxDecoration(
                                    color: ColorConstant.lightPink,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top:
                                                screenHeight *
                                                0.015, // Made responsive
                                            left:
                                                screenWidth *
                                                0.02, // Made responsive
                                          ),
                                          child: Image.asset(
                                            ImageAssetConstant
                                                .trendingImage, // replace with your image
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          left: 0,
                                          right: 0,
                                          child: Container(
                                            height: screenHeight * 0.008, // line thickness
                                            color: ColorConstant
                                                .backgroundColor, // line color
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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

// Profile Card Widget for grid layout
class ProfileCard extends StatelessWidget {
  final String name;
  final String title;
  final String image;
  final double screenWidth;
  final double screenHeight;

  const ProfileCard({
    super.key,
    required this.name,
    required this.title,
    required this.image,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(
            left: screenWidth * 0.002,
            right: screenWidth * 0.002,
          ),
          decoration: BoxDecoration(
            color: ColorConstant.lightPink,
            borderRadius: BorderRadius.circular(screenWidth * 0.04),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.01),
                    child: Container(
                      width:
                          screenWidth *
                          0.08, // Fixed: Reasonable size for grid cell (adjust as needed)
                      height: screenWidth * 0.08, // Fixed: Square for circle
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                      ),
                      child: Image.asset(
                        ImageAssetConstant.profileImage,
                        fit: BoxFit.cover, // Ensures image fits the circle
                      ),
                    ),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: screenWidth * 0.025,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Art Director", // Note: Using hardcoded "Art Director" instead of title; adjust if needed
                    style: TextStyle(
                      fontSize: screenWidth * 0.02,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: screenHeight * 0.008, // line thickness
                  decoration: BoxDecoration(
                    color: ColorConstant.backgroundColor, // line color
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(screenWidth * 0.04),
                      topRight: Radius.circular(screenWidth * 0.04),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: screenWidth * 0.03,
          right: screenWidth * 0.005,
          child: GestureDetector(
            onTap: () {
              print('Close profile card tapped');
            },
            child: Icon(
              Icons.close,
              size: screenWidth * 0.02,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
