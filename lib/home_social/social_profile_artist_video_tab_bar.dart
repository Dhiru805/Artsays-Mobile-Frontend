import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/svg_asset_constant.dart';
import 'package:artsays_app/home_social/profileTabBar/screen/bookmark_tab_bar_view.dart';
import 'package:artsays_app/home_social/profileTabBar/screen/products_tab_bar_view.dart';
import 'package:artsays_app/home_social/profileTabBar/screen/social_profile_artist.dart';
import 'package:artsays_app/home_social/profileTabBar/screen/social_profile_artist_video.dart';
import 'package:artsays_app/home_social/profileTabBar/screen/social_profile_join_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialProfileArtistVideoTabBar extends StatefulWidget {
  const SocialProfileArtistVideoTabBar({super.key});

  @override
  State<SocialProfileArtistVideoTabBar> createState() =>
      _SocialProfileArtistVideoTabBarState();
}

class _SocialProfileArtistVideoTabBarState
    extends State<SocialProfileArtistVideoTabBar>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideAnimation =
        Tween<Offset>(
          begin: const Offset(0, -1), // start slightly above
          end: Offset.zero, // slide into normal position
        ).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
        );

    // Start animation when screen opens
    _animationController.forward();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildTabItem(
    String svgPath,
    int index,
    double iconSize,
    double padding,
  ) {
    final bool isSelected = _tabController.index == index;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SvgPicture.asset(
        svgPath,
        height: iconSize,
        colorFilter: isSelected
            ? ColorFilter.mode(ColorConstant.backgroundColor, BlendMode.srcIn)
            : ColorFilter.mode(Colors.white, BlendMode.srcIn),
        // colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          screenHeight * 0.1,
        ), // Adjust height as needed
        child: SlideTransition(
          position: _slideAnimation,
          child: AppBar(
            backgroundColor: ColorConstant.backgroundColor,
            elevation: 0,
            automaticallyImplyLeading: false,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),

            // 🟢 Title + Icons
            title: Text(
              "Clay Artist",
              style: GoogleFonts.montserrat(
                fontSize: screenWidth * 0.065,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.notifications_outlined,
                  size: screenWidth * 0.065,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],

            // 🟢 TabBar inside AppBar bottom
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(screenHeight * 0.03),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.transparent,
                  isScrollable: true,
                  labelPadding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.02,
                  ),

                  tabs: [
                    Tab(
                      child: _buildTabItem(
                        SvgImageAssetConstant.userSvg,
                        0,
                        screenWidth * 0.055,
                        screenWidth * 0.015,
                      ),
                    ),
                    Tab(
                      child: _buildTabItem(
                        SvgImageAssetConstant.socialWifi,
                        1,
                        screenWidth * 0.055,
                        screenWidth * 0.015,
                      ),
                    ),
                    Tab(
                      child: _buildTabItem(
                        SvgImageAssetConstant.bookmarkSvg,
                        2,
                        screenWidth * 0.055,
                        screenWidth * 0.015,
                      ),
                    ),
                    Tab(
                      child: _buildTabItem(
                        SvgImageAssetConstant.productsSvg,
                        3,
                        screenWidth * 0.055,
                        screenWidth * 0.015,
                      ),
                    ),
                    Tab(
                      child: _buildTabItem(
                        SvgImageAssetConstant.profileSvg,
                        4,
                        screenWidth * 0.055,
                        screenWidth * 0.015,
                      ),
                    ),
                  ],
                  onTap: (_) => setState(() {}),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: TabBarView(
          controller: _tabController,
          children: const [
            Center(child: BookmarkTabBarView()),
            Center(child: SocialProfileArtistVideo()),
            Center(child: SocialProfileJoinTabBarView()),
            Center(child: ProductsTabBarView()),
            Center(child: SocialProfileArtist()),
          ],
        ),
      ),
    );
  }
}
