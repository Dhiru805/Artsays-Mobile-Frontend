import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:artsays_app/constants/svg_asset_constant.dart';
import 'package:artsays_app/shared/widgets/bottom_bar_menu.dart';
import 'package:flutter/material.dart';

class HomeBottomNavBar extends StatefulWidget {
  const HomeBottomNavBar({super.key});

  @override
  State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  int _selectedIndex = 0;
  List<Widget> screen = [
    Center(
      child: Text(
        'Home screen',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ),
    Center(
      child: Text(
        'Search Screen',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
    ),
    Center(
      child: Text(
        'Explore Screen',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.amber,
        ),
      ),
    ),
    Center(
      child: Text(
        'Profile Screen',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: screen[_selectedIndex]),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Container(
          height: 70,
          color: ColorConstant.backgroundColor,
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
                selectedSvg: SvgImageAssetConstant.bidIcon,
                unselectedSvg: SvgImageAssetConstant.bidIcon,
                name: 'Bid',
                isSelected: _selectedIndex == 1,
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
              ),
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                  height: 70,
                  width: 74.94,
                  child: Image.asset(ImageAssetConstant.cartNavBarImage),
                ),
              ),
              BottomBarMenu(
                selectedSvg: SvgImageAssetConstant.categoryIcon,
                unselectedSvg: SvgImageAssetConstant.categoryIcon,
                name: 'Categories',
                isSelected: _selectedIndex == 2,
                onTap: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
              ),
              BottomBarMenu(
                selectedSvg: SvgImageAssetConstant.profileIcon,
                unselectedSvg: SvgImageAssetConstant.profileIcon,
                name: 'Profile',
                isSelected: _selectedIndex == 3,
                onTap: () {
                  setState(() {
                    _selectedIndex = 3;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
