import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:artsays_app/home_social/widget/social_bottom_animation.dart';
import 'package:flutter/material.dart';

class HomeSocialScreen extends StatefulWidget {
  const HomeSocialScreen({super.key});

  @override
  State<HomeSocialScreen> createState() => _HomeSocialScreenState();
}

class _HomeSocialScreenState extends State<HomeSocialScreen>
    with SingleTickerProviderStateMixin {
  late double screenWidth;
  late double screenHeight;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      // appBar: const CustomAppBar(title: '', fontFamily: '', centerTitle: false),
      body: SocialBottomAnimation(
        child: SingleChildScrollView(
          child: Container(
            width: screenWidth,
            decoration: BoxDecoration(
              color: ColorConstant.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(screenWidth * 0.07),
                topRight: Radius.circular(screenWidth * 0.07),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.01),

                _buildPostCard(
                  profileImage: ImageAssetConstant.profileImage,
                  username: 'Nelson_doley',
                  image: ImageAssetConstant.computerImage,
                  caption: 'Lorem ipsum dolor sit amet.... more',
                  commentsCount: 32,
                  timeAgo: '25 minutes ago',
                  topVerified: true,
                  showFollow: false,
                  showBuyButton: true,
                ),

                SizedBox(height: screenHeight * 0.015),

                _buildPostCard(
                  profileImage: ImageAssetConstant.profileImage,
                  username: 'Nelson_doley',
                  image: ImageAssetConstant.instaPost2,
                  caption: 'New artwork drop 🎨✨',
                  showFollow: true,
                  commentsCount: 18,
                  timeAgo: '1 hour ago',
                  topVerified: true,
                  showBuyButton: false,
                ),
                SizedBox(height: screenHeight * 0.015),

                _buildPostCard(
                  profileImage: ImageAssetConstant.profileImage,
                  username: 'Nelson_doley',
                  image: ImageAssetConstant.instaPost2,
                  caption: 'New artwork drop 🎨✨',
                  showFollow: true,
                  commentsCount: 18,
                  timeAgo: '1 hour ago',
                  topVerified: true,
                  showBuyButton: false,
                ),
                SizedBox(height: screenHeight * 0.015),

                _buildPostCard(
                  profileImage: ImageAssetConstant.profileImage,
                  username: 'Nelson_doley',
                  image: ImageAssetConstant.instaPost2,
                  caption: 'New artwork drop 🎨✨',
                  showFollow: true,
                  commentsCount: 18,
                  timeAgo: '1 hour ago',
                  topVerified: true,
                  showBuyButton: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPostCard({
    required String profileImage,
    required String username,
    required String image,
    required String caption,
    required int commentsCount,
    required String timeAgo,
    required bool topVerified,
    required bool showFollow,
    bool showBuyButton = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.02,
        vertical: screenHeight * 0.005,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: screenWidth * 0.045,
                    backgroundImage: AssetImage(profileImage),
                  ),
                  SizedBox(width: screenWidth * 0.025),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            username,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.035,
                            ),
                          ),
                          if (topVerified) ...[
                            SizedBox(width: screenWidth * 0.01),
                            Icon(
                              Icons.verified,
                              color: Colors.blue,
                              size: screenWidth * 0.04,
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                  if (showFollow)
                    Row(
                      children: [
                        SizedBox(width: screenWidth * 0.01),
                        Image.asset(ImageAssetConstant.dotImage),
                        SizedBox(width: screenWidth * 0.01),
                        Text(
                          "Follow",
                          style: TextStyle(
                            color: ColorConstant.backgroundColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
              Row(
                children: [
                  if (showBuyButton)
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0XFF48372D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            screenWidth * 0.05,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.04,
                          vertical: screenHeight * 0.007,
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Buy",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.015),
                          Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                            size: screenWidth * 0.045,
                          ),
                        ],
                      ),
                    ),
                  if (!showBuyButton) const SizedBox(width: 0),
                  SizedBox(width: screenWidth * 0.02),
                  Icon(Icons.more_vert, size: screenWidth * 0.055),
                ],
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.015),
          ClipRRect(
            borderRadius: BorderRadius.circular(screenWidth * 0.03),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SizedBox(height: screenHeight * 0.015),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite_border, size: screenWidth * 0.07),
                    Text(
                      "15.K",
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    Image.asset(
                      ImageAssetConstant.commentImage,
                      width: screenWidth * 0.06,
                    ),
                    Text(
                      "$commentsCount",
                      style: TextStyle(
                        fontSize: screenWidth * 0.03,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    Image.asset(
                      ImageAssetConstant.shareImage,
                      width: screenWidth * 0.06,
                    ),
                  ],
                ),
                Icon(Icons.bookmark_border, size: screenWidth * 0.07),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.008),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '$username ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                  TextSpan(
                    text: caption,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.008),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
            child: Text(
              'View all $commentsCount comments',
              style: TextStyle(
                color: Colors.grey,
                fontSize: screenWidth * 0.032,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.008),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
            child: Text(
              timeAgo,
              style: TextStyle(
                color: Colors.grey,
                fontSize: screenWidth * 0.03,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
        ],
      ),
    );
  }
}
