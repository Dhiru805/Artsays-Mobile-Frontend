import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/credentials/api_base_url.dart';
import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:artsays_app/home_social/widget/social_bottom_animation.dart';
import 'package:artsays_app/services/local_data_storage_service.dart';
import 'package:flutter/material.dart';

import '../../../../model/community_models/home_page_model.dart';
import '../../../../services/api_services/community_apis/community_api_services.dart';

class HomeSocialScreen extends StatefulWidget {
  const HomeSocialScreen({super.key});

  @override
  State<HomeSocialScreen> createState() => _HomeSocialScreenState();
}

class _HomeSocialScreenState extends State<HomeSocialScreen>
    with SingleTickerProviderStateMixin {
  late double screenWidth;
  late double screenHeight;
  String? userId;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      body: SocialBottomAnimation(
        child: Container(
          width: screenWidth,
          decoration: BoxDecoration(
            color: ColorConstant.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(screenWidth * 0.07),
              topRight: Radius.circular(screenWidth * 0.07),
            ),
          ),
          child: FutureBuilder(
            future: getHomePageData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              }

              if (snapshot.connectionState == ConnectionState.done) {
                // print(snapshot.data!.posts.length);
                return ListView.builder(
                  itemCount: snapshot.data!.posts.length,
                  itemBuilder: (context, index) {
                    List<PostsModel> posts = snapshot.data!.posts;
                    return _buildPostCard(
                      profileImage: posts[index].user.profilePhoto ?? "null",
                      username: posts[index].user.userName ?? "null",
                      image: ImageAssetConstant.computerImage,
                      caption: posts[index].caption,
                      commentsCount: posts[index].comments.length,
                      timeAgo: '25 minutes ago',
                      topVerified: posts[index].user.verified!.isNotEmpty,
                      showFollow: posts[index].showFollowButton,
                      showBuyButton: true,
                      likenCount: posts[index].likes.length,
                      isSaved: posts[index].isSaved,
                      isLiked: posts[index].likes.contains(userId)
                    );
                  },
                );
              }

              return Center(child: Text("Something went wrong"));
            },
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
    required int likenCount,
    required String timeAgo,
    required bool topVerified,
    required bool showFollow,
    required bool isSaved,
    required bool isLiked,
    bool showBuyButton = false,
  }) {
    profileImage = '$apiBaseUrl$profileImage';
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
                    backgroundImage: profileImage == "null"
                        ? AssetImage(ImageAssetConstant.profileImage)
                        : NetworkImage(profileImage),
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
                    GestureDetector(
                      child: Row(
                        children: [
                          Icon(isLiked ? Icons.favorite : Icons.favorite_border, size: screenWidth * 0.07, color: isLiked ? Colors.red : null,),
                          Text(
                            likenCount.toString(),
                            style: TextStyle(
                              fontSize: screenWidth * 0.03,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    GestureDetector(
                      child: Row(
                        children: [
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
                        ],
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    GestureDetector(
                      child: Image.asset(
                        ImageAssetConstant.shareImage,
                        width: screenWidth * 0.06,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    isSaved = !isSaved;
                  },
                  icon: Icon(
                    isSaved ? Icons.bookmark : Icons.bookmark_border,
                    size: screenWidth * 0.07,
                  ),
                ),
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

  Future<HomePageModel> getHomePageData() async {
    userId = await getUserID();
    String? token = await getAuthToken();
    HomePageModel data = await getCommunityHomePageData(userId!, token!);

    return data;
  }
}
