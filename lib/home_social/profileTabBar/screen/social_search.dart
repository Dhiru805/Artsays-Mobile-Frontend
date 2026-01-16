import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:artsays_app/constants/svg_asset_constant.dart';
import 'package:artsays_app/home_social/widget/social_bottom_animation.dart';
import 'package:artsays_app/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialSearch extends StatefulWidget {
  const SocialSearch({super.key});

  @override
  State<SocialSearch> createState() => _SocialSearchState();
}

class _SocialSearchState extends State<SocialSearch>
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      appBar: CustomAppBar(
        onNotificationTap: () {},
        title: '',
        fontFamily: '',
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
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
                          SizedBox(height: screenHeight * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _buildTag("All", screenWidth, screenHeight),
                              SizedBox(width: 3),
                              _buildTag("Unwatched", screenWidth, screenHeight),
                              SizedBox(width: 3),
                              _buildTag("Live", screenWidth, screenHeight),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.015),
                          Flexible(
                            fit: FlexFit.loose,
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
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
                          ),
                          // SizedBox(height: screenHeight * 0.01),
                          Expanded(
                            child: ListView.builder(
                              itemCount: recentSearches.length > 5
                                  ? 5
                                  : recentSearches.length,
                              // physics:
                              //     const NeverScrollableScrollPhysics(), // ❌ disable scroll
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(0),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor:
                                                  Colors.transparent,
                                              child: SvgPicture.asset(
                                                SvgImageAssetConstant
                                                    .searchListIcon,
                                                width: 18,
                                                height: 18,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            Text(
                                              recentSearches[index],
                                              style: TextStyle(
                                                fontSize: screenWidth * 0.035,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Icon(
                                        Icons.close,
                                        color: Colors.black,
                                        size: screenWidth * 0.04,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),

                          _buildVideoCard(screenWidth, screenHeight),
                          SizedBox(height: screenHeight * 0.01),
                          _buildVideoCard(screenWidth, screenHeight),
                          SizedBox(height: screenHeight * 0.01),
                          const Divider(indent: 1),
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
                              _buildTrendingCard(screenWidth, screenHeight),
                              _buildTrendingCard(screenWidth, screenHeight),
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
        ],
      ),
    );
  }

  Widget _buildTag(String text, double screenWidth, double screenHeight) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.02,
        vertical: screenHeight * 0.004,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFECE6E6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: screenWidth * 0.03, color: Colors.black),
      ),
    );
  }

  Widget _buildVideoCard(double screenWidth, double screenHeight) {
    return Container(
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

  Widget _buildTrendingCard(double screenWidth, double screenHeight) {
    return Container(
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
                top: screenHeight * 0.015,
                left: screenWidth * 0.02,
              ),
              child: Image.asset(
                ImageAssetConstant.trendingImage,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(height: 8, color: ColorConstant.backgroundColor),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String title;
  final String image;
  final double screenWidth;
  final double screenHeight;

  const ProfileCard({
    Key? key,
    required this.name,
    required this.title,
    required this.image,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.002),
          decoration: BoxDecoration(
            color: ColorConstant.lightPink,
            borderRadius: BorderRadius.circular(screenWidth * 0.04),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.01),
                    child: Container(
                      width: screenWidth * 0.5,
                      height: screenWidth * 0.08,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Image(
                        image: AssetImage(ImageAssetConstant.profileImage),
                        width: 24,
                        height: 24,
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
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: screenWidth * 0.02,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: ColorConstant.backgroundColor,
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
            onTap: () {},
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
