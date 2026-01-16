import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:artsays_app/constants/svg_asset_constant.dart';
import 'package:artsays_app/shared/widgets/bottom_bar_menu.dart';
import 'package:flutter/material.dart';

class CertificationBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CertificationBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 🔹 "Create Certification" Button (above the nav bar)

        // 🔹 Bottom Navigation Bar
        Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(0, -3),
                blurRadius: 10,
                color: Color(0x33000000),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Container(
              height: 70,
              color: ColorConstant.backgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomBarMenu(
                    selectedSvg: SvgImageAssetConstant.homeIcon,
                    unselectedSvg: SvgImageAssetConstant.homeIcon,
                    name: 'Home',
                    isSelected: selectedIndex == 0,
                    onTap: () => onItemSelected(0),
                  ),
                  BottomBarMenu(
                    selectedSvg: SvgImageAssetConstant.bidIcon,
                    unselectedSvg: SvgImageAssetConstant.bidIcon,
                    name: 'Bid',
                    isSelected: selectedIndex == 1,
                    onTap: () => onItemSelected(1),
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
                    isSelected: selectedIndex == 2,
                    onTap: () => onItemSelected(2),
                  ),
                  BottomBarMenu(
                    selectedSvg: SvgImageAssetConstant.profileIcon,
                    unselectedSvg: SvgImageAssetConstant.profileIcon,
                    name: 'Profile',
                    isSelected: selectedIndex == 3,
                    onTap: () => onItemSelected(3),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
