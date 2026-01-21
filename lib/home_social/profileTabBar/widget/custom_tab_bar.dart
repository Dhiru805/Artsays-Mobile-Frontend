import 'package:artsays_app/certification/screen/certification_main_screen.dart';
import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/svg_asset_constant.dart';
import 'package:artsays_app/home_social/profileTabBar/screen/artist_tab_bar_view.dart';
import 'package:artsays_app/home_social/profileTabBar/screen/bookmark_tab_bar_view.dart';
import 'package:artsays_app/home_social/profileTabBar/screen/products_tab_bar_view.dart';
import 'package:artsays_app/home_social/profileTabBar/screen/settings_screen.dart';
import 'package:artsays_app/home_social/profileTabBar/screen/social_profile_artist_my_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    // 🔹 Smooth tab highlight without lag
    _tabController.addListener(() {
      _currentIndex.value = _tabController.index;
    });

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _animationController.dispose();
    _currentIndex.dispose();
    super.dispose();
  }

  Widget _buildTabItem(String svgPath, int index, double iconSize) {
    return ValueListenableBuilder<int>(
      valueListenable: _currentIndex,
      builder: (_, currentIndex, __) {
        final isSelected = currentIndex == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SvgPicture.asset(
            svgPath,
            height: iconSize,
            colorFilter: isSelected
                ? ColorFilter.mode(
                    ColorConstant.backgroundColor,
                    BlendMode.srcIn,
                  )
                : const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.1),
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CertificationMainScreen(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.refresh_sharp,
                  size: screenWidth * 0.065,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()),
                  );
                },
                icon: Icon(
                  Icons.settings_outlined,
                  size: screenWidth * 0.065,
                  color: Colors.white,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.notifications_outlined,
                  size: screenWidth * 0.065,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
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
                    horizontal: screenWidth * 0.04,
                  ),
                  tabs: [
                    Tab(
                      child: _buildTabItem(
                        SvgImageAssetConstant.userSvg,
                        0,
                        screenWidth * 0.055,
                      ),
                    ),
                    Tab(
                      child: _buildTabItem(
                        SvgImageAssetConstant.bookmarkSvg,
                        1,
                        screenWidth * 0.055,
                      ),
                    ),
                    Tab(
                      child: _buildTabItem(
                        SvgImageAssetConstant.productsSvg,
                        2,
                        screenWidth * 0.055,
                      ),
                    ),
                    Tab(
                      child: _buildTabItem(
                        SvgImageAssetConstant.profileSvg,
                        3,
                        screenWidth * 0.055,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: BookmarkTabBarView()),
          Center(child: ArtistTabBarView()),
          Center(child: ProductsTabBarView()),
          Center(child: SocialProfileArtistMyAccount()),
        ],
      ),
    );
  }
}
