import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:artsays_app/constants/svg_asset_constant.dart';
import 'package:artsays_app/ui/buyer/community/screens/home_social_screen.dart';
import 'package:artsays_app/ui/buyer/community/screens/social_search_screen.dart';
import 'package:artsays_app/shared/widgets/bottom_bar_menu.dart';
import 'package:flutter/material.dart';

class HomeBottomNavBar extends StatefulWidget {
  const HomeBottomNavBar({super.key});

  @override
  State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  int _selectedIndex = 0;
  List<Widget> get screen => [
    Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeSocialScreen()),
          );
        },
        child: Text('Home Screen', style: TextStyle(fontSize: 20)),
      ),
    ),
    Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SocialSearchScreen()),
          );
        },
        child: Text('Social Search New Screen', style: TextStyle(fontSize: 20)),
      ),
    ),
    Center(
      child: ElevatedButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => SocialAddScreen()),
          // );
        },
        child: Text('Social Add Screen', style: TextStyle(fontSize: 20)),
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
