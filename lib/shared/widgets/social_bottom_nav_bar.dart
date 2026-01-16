import 'dart:io';

import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:artsays_app/constants/svg_asset_constant.dart';
import 'package:artsays_app/home_social/profileTabBar/widget/custom_tab_bar.dart';
import 'package:artsays_app/home_social/screen/home_social_screen.dart';
import 'package:artsays_app/home_social/screen/social_add/add_post_details.dart';
import 'package:artsays_app/home_social/screen/social_add/create_post_screen.dart';
import 'package:artsays_app/home_social/screen/social_add/social_add_screen.dart';
import 'package:artsays_app/home_social/screen/social_explore_screen.dart';
import 'package:artsays_app/home_social/screen/social_search_screen.dart';
import 'package:artsays_app/shared/widgets/bottom_bar_menu.dart';
import 'package:artsays_app/shared/widgets/custom_app_bar.dart';
import 'package:artsays_app/shared/widgets/notification_screen.dart'; // ✅ Add import at top
import 'package:flutter/material.dart';

class SocialBottomNavBar extends StatefulWidget {
  const SocialBottomNavBar({super.key});

  @override
  State<SocialBottomNavBar> createState() => _SocialBottomNavBarState();
}

class _SocialBottomNavBarState extends State<SocialBottomNavBar> {
  int _selectedIndex = 0;
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    List<Widget> screen = [
      HomeSocialScreen(),
      SocialSearchScreen(),
      SocialAddScreen(
        onCreatePostTap: () {
          setState(() {
            _selectedIndex = 5; // index of CreatePostScreen
          });
        },
      ),
      SocialExploreScreen(),
      CustomTabBar(),

      CreatePostScreen(
        onCreatePostTap: (File imageFile) {
          setState(() {
            _selectedImage = imageFile;
            _selectedIndex = 6; // index of CreatePostScreen
          });
        },
      ),
      AddPostDetails(imageFile: _selectedImage),
      NotificationScreen(),
    ];

    return Scaffold(
      backgroundColor: (_selectedIndex == 2 || _selectedIndex == 4)
          ? ColorConstant.backgroundColor
          : Colors.white,

      // appBar: (_selectedIndex != 4)
      //     ? CustomAppBar(
      //         onNotificationTap: () {
      //           setState(() {
      //             _selectedIndex = 7; // ✅ show notifications
      //           });
      //         },
      //         title: '',
      //         fontFamily: '',
      //         centerTitle: false,
      //       )
      //     : null,
      appBar: (_selectedIndex != 4)
          ? PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: _selectedIndex == 7
                      ? Radius.circular(30)
                      : Radius.zero,
                  bottomRight: _selectedIndex == 7
                      ? Radius.circular(30)
                      : Radius.zero,
                ),
                child: CustomAppBar(
                  onNotificationTap: () {
                    setState(() {
                      _selectedIndex = 7; // ✅ show notifications
                    });
                  },
                  title: '',
                  fontFamily: '',
                  centerTitle: false,
                ),
              ),
            )
          : null,

      body: Center(child: screen[_selectedIndex]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -3), // 👈 goes upward, visible above nav bar
              blurRadius: 10,
              spreadRadius: 0,
              color: Color(0x33000000), // translucent black for visibility
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Container(
            height: 70,
            decoration: BoxDecoration(color: ColorConstant.backgroundColor),
            //padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                BottomBarMenu(
                  selectedSvg: SvgImageAssetConstant.homeIcon,
                  unselectedSvg: SvgImageAssetConstant.homeIcon,
                  name: 'Home',
                  isSelected: _selectedIndex == 0,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                ),
                BottomBarMenu(
                  selectedSvg: SvgImageAssetConstant.searchIcon,
                  unselectedSvg: SvgImageAssetConstant.searchIcon,
                  name: 'Search',
                  isSelected: _selectedIndex == 1,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 2; // index of SocialAddScreen
                    });
                  }, // this button is + icon in bottaom navigation bar//
                  child: SizedBox(
                    height: 70,
                    width: 74.94,
                    child: Image.asset(ImageAssetConstant.addNavBarImage),
                  ),
                ),
                BottomBarMenu(
                  selectedSvg: SvgImageAssetConstant.exploreIcon,
                  unselectedSvg: SvgImageAssetConstant.exploreIcon,
                  name: 'Explore',
                  isSelected: _selectedIndex == 3,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 3;
                    });
                  },
                ),
                BottomBarMenu(
                  selectedSvg: SvgImageAssetConstant.profileIcon,
                  unselectedSvg: SvgImageAssetConstant.profileIcon,
                  name: 'Profile',
                  isSelected: _selectedIndex == 4,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 4;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
