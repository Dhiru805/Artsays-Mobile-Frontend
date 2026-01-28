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
          child: FutureBuilder<HomePageModel>(
            future: getHomePageData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }

              final posts = snapshot.data!.posts;

              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];

                  return _buildPostCard(
                    profileImage: post.user.profilePhoto ??
                        "https://imgs.search.brave.com/7AtswmQtKSI7uikhXSWM07przAfFOQV4edS2mpZ3oS8/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMjIy/MTkxNTU4NS92ZWN0/b3IvZ3JleS1hdmF0/YXItaWNvbi11c2Vy/LWF2YXRhci1waG90/by1pY29uLXNvY2lh/bC1tZWRpYS11c2Vy/LWljb24tdmVjdG9y/LmpwZz9zPTYxMng2/MTImdz0wJms9MjAm/Yz05Q09iQnFMOHI2/NW9WZkhFNGh5RXFw/eWI4RndLN1ZmRHFG/MXFYRDVZTXo0PQ",
                    username: post.user.userName ?? '',
                    image: post.images,
                    caption: post.caption,
                    commentsCount: post.comments.length,
                    likenCount: post.likes.length,
                    topVerified: post.user.verified!.isNotEmpty,
                    showFollow: post.showFollowButton,
                    showBuyButton: true,
                    isSaved: post.isSaved,
                    isLiked: post.likes.contains(userId),
                    verificationBadge: post.user.verified!.isNotEmpty ? post.user.verified!.first.badgeImage : "",
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPostCard({
    required String profileImage,
    required String username,
    required List<String> image,
    required String caption,
    required int commentsCount,
    required int likenCount,
    required bool topVerified,
    required bool showFollow,
    required bool isSaved,
    required bool isLiked,
    required String verificationBadge,
    bool showBuyButton = false,
  }) {
    if (!profileImage.startsWith('http')) {
      profileImage = '$apiBaseUrl$profileImage';
    }

    if(!verificationBadge.startsWith('http')) {
      verificationBadge = '$apiBaseUrl$verificationBadge';
    }

    final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.02,
        vertical: screenHeight * 0.01,
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
                    backgroundColor: Colors.grey.shade200,
                    child: ClipOval(
                      child: Image.network(
                        profileImage,
                        width: screenWidth * 0.09,
                        height: screenWidth * 0.09,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            ImageAssetConstant.profileImage,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.025),
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
                        Image.network(
                          verificationBadge,
                          width: screenWidth * 0.05,
                          height: screenWidth * 0.05,
                        ),
                      ],
                    ],
                  ),
                ],
              ),
              if(showFollow) ...[
                SizedBox(width: screenWidth * 0.01),
                ElevatedButton(onPressed: (){}, child: Text('Follow'))
              ],
              Icon(Icons.more_vert, size: screenWidth * 0.055),
            ],
          ),

          SizedBox(height: screenHeight * 0.015),

          SizedBox(
            height: screenHeight * 0.35,
            child: PageView.builder(
              itemCount: image.length,
              onPageChanged: (index) {
                currentIndex.value = index;
              },
              itemBuilder: (context, index) {
                String imageUrl = image[index];
                if (!imageUrl.startsWith('http')) {
                  imageUrl = '$apiBaseUrl$imageUrl';
                }

                return Padding(padding: EdgeInsets.all(2), child: ClipRRect(
                  borderRadius:
                  BorderRadius.circular(screenWidth * 0.03),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.contain,
                    width: double.infinity,
                    errorBuilder: (_, __, ___) {
                      return Image.asset(
                        ImageAssetConstant.computerImage,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),);
              },
            ),
          ),

          /// ✅ DOTS BELOW IMAGE
          if (image.length > 1)
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.01),
              child: ValueListenableBuilder<int>(
                valueListenable: currentIndex,
                builder: (context, index, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(image.length, (dotIndex) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        margin:
                        const EdgeInsets.symmetric(horizontal: 4),
                        width: index == dotIndex ? 8 : 6,
                        height: index == dotIndex ? 8 : 6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == dotIndex
                              ? Colors.black
                              : Colors.black26,
                        ),
                      );
                    }),
                  );
                },
              ),
            ),

          SizedBox(height: screenHeight * 0.015),

          /// ACTIONS
          Row(
            children: [
              Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: isLiked ? Colors.red : null,
                size: screenWidth * 0.07,
              ),
              SizedBox(width: screenWidth * 0.01),
              Text(likenCount.toString()),
              SizedBox(width: screenWidth * 0.04),
              Image.asset(
                ImageAssetConstant.commentImage,
                width: screenWidth * 0.06,
              ),
              SizedBox(width: screenWidth * 0.01),
              Text(commentsCount.toString()),
            ],
          ),

          SizedBox(height: screenHeight * 0.01),

          /// CAPTION
          RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: '$username ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: caption),
              ],
            ),
          ),

          SizedBox(height: screenHeight * 0.01),

          Text(
            'View all $commentsCount comments',
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Future<HomePageModel> getHomePageData() async {
    userId = await getUserID();
    final token = await getAuthToken();
    return getCommunityHomePageData(userId!, token!);
  }
}
