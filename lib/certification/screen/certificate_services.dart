import 'dart:io';

import 'package:artsays_app/certification/widget/certification_appbar.dart';
import 'package:artsays_app/certification/widget/certification_bottom_nav_bar.dart';
import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/home_social/widget/social_bottom_animation.dart';
import 'package:flutter/material.dart';

class CertificateServices extends StatefulWidget {
  const CertificateServices({super.key});

  @override
  State<CertificateServices> createState() => _CertificateServicesState();
}

class _CertificateServicesState extends State<CertificateServices> {
  int _selectedIndex = 0;
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: (_selectedIndex == 2 || _selectedIndex == 4)
          ? ColorConstant.backgroundColor
          : Colors.white,

      appBar: const CertificationAppbar(),

      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: Column(
              children: [
                // 🔹 Title Section
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.01,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "My Account",
                      style: TextStyle(
                        color: ColorConstant.orange,
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // 🔹 List Section
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(screenWidth * 0.07),
                        topRight: Radius.circular(screenWidth * 0.07),
                      ),
                    ),
                    width: double.infinity,
                    child: ListView(
                      children: [
                        _buildListItem(
                          "Dashboard",
                          0,
                          screenWidth,
                          screenHeight,
                        ),
                        _buildListItem("Blog", 1, screenWidth, screenHeight),
                        _buildListItem(
                          "Services",
                          2,
                          screenWidth,
                          screenHeight,
                        ),
                        _buildListItem(
                          "Portfolio",
                          3,
                          screenWidth,
                          screenHeight,
                        ),
                        _buildListItem(
                          "About Us",
                          4,
                          screenWidth,
                          screenHeight,
                        ),
                        _buildListItem("Contact", 5, screenWidth, screenHeight),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 1,
            right: 1,
            child: Container(
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
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.015,
                      bottom: screenHeight * 0.015,
                    ),
                    child: SocialBottomAnimation(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                label: Text(
                                  "Create Certification",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    vertical: screenHeight * 0.008,
                                    horizontal: screenWidth * 0.004,
                                  ),
                                  backgroundColor:
                                      ColorConstant.backgroundColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      screenWidth * 0.05,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      // 🔹 Bottom Navigation Bar
      bottomNavigationBar: CertificationBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

// 🔹 Responsive List Tile Widget
Widget _buildListItem(
  String title,
  int index,
  double screenWidth,
  double screenHeight,
) {
  bool isEven = index % 2 == 0;
  return Container(
    decoration: BoxDecoration(
      color: isEven ? Colors.transparent : const Color(0xFFF8F8F8),
    ),
    margin: EdgeInsets.symmetric(
      horizontal: screenWidth * 0.03,
      vertical: screenHeight * 0.001,
    ),
    child: ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: screenWidth * 0.037,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: screenWidth * 0.05,
        color: Colors.black,
      ),
      onTap: () {
        debugPrint("$title tapped");
      },
    ),
  );
}
