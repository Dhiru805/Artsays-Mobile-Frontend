import 'package:flutter/material.dart';

import '../../../certification/widget/certification_appbar.dart';
import '../../../constants/color_constant.dart';
import '../../widget/social_bottom_animation.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool showCertificate = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double bottomSheetHeight =
    showCertificate ? screenHeight * 0.12 : 0;

    return Scaffold(
      appBar: const CertificationAppbar(city: "City",),

      body: Stack(
        children: [
          // 🔹 Main Content
          Padding(
            padding: EdgeInsets.fromLTRB(
              screenWidth * 0.02,
              screenWidth * 0.02,
              screenWidth * 0.02,
              screenHeight * 0.12, // space for logout button
            ),
            child: Column(
              children: [
                // 🔹 Title
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
                  child: ListView(
                    children: [
                      _buildListItem(
                        "Dashboard",
                        0,
                        screenWidth,
                        screenHeight,
                            () {},
                      ),
                      _buildListItem(
                        "Blog",
                        1,
                        screenWidth,
                        screenHeight,
                            () {},
                      ),
                      _buildListItem(
                        "Certification service",
                        2,
                        screenWidth,
                        screenHeight,
                            () {
                          setState(() {
                            showCertificate = !showCertificate;
                          });
                        },
                      ),
                      _buildListItem(
                        "Services",
                        3,
                        screenWidth,
                        screenHeight,
                            () {},
                      ),
                      _buildListItem(
                        "Portfolio",
                        4,
                        screenWidth,
                        screenHeight,
                            () {},
                      ),
                      _buildListItem(
                        "About Us",
                        5,
                        screenWidth,
                        screenHeight,
                            () {},
                      ),
                      _buildListItem(
                        "Contact",
                        6,
                        screenWidth,
                        screenHeight,
                            () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 🔹 Sticky Logout Button (Moves Up Automatically)
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            left: 15,
            right: 15,
            bottom: bottomSheetHeight + 10,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.014,
                ),
                backgroundColor: ColorConstant.backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    screenWidth * 0.05,
                  ),
                ),
              ),
              child: Text(
                "Logout",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),

      // 🔹 Bottom Sheet
      bottomSheet: showCertificate
          ? Container(
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
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.015,
              horizontal: 15,
            ),
            child: SocialBottomAnimation(
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        debugPrint("Creating certificate");
                      },
                      icon: const Icon(
                        Icons.workspace_premium,
                        color: Colors.white,
                      ),
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
      )
          : null,
    );
  }
}

// 🔹 Responsive List Tile
Widget _buildListItem(
    String title,
    int index,
    double screenWidth,
    double screenHeight,
    VoidCallback onTap,
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
      onTap: onTap,
    ),
  );
}
