import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:artsays_app/home_social/widget/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/size_config.dart';

class CustomSliderContainer extends StatefulWidget {
  const CustomSliderContainer({super.key});

  @override
  State<CustomSliderContainer> createState() => _CustomSliderContainerState();
}

class _CustomSliderContainerState extends State<CustomSliderContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final screenHeight = SizeConfig.screenHeight;
    final screenWidth = SizeConfig.screenWidth;
    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        padding: EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: ColorConstant.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(screenWidth * 0.1),
            topRight: Radius.circular(screenWidth * 0.1),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Image
                const CircleAvatar(
                  radius: 38,
                  backgroundImage: AssetImage(ImageAssetConstant.nehaShetty),
                ),
                SizedBox(width: screenWidth * 0.016),
                // Name and Stats
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Neha Shetty",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: SizeConfig.getFont(16),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.012),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          _StatItem(value: "15", label: "Posts"),
                          _StatItem(value: "15M", label: "Followers"),
                          _StatItem(value: "15", label: "Following"),
                        ],
                      ),
                    ],
                  ),
                ),
                CustomPopupMenu(
                  iconDir: "vertical",
                  items: [
                    CustomPopupMenuItemData(label: "Block", onTap: () {}),
                    CustomPopupMenuItemData(label: "Unfollow", onTap: () {}),
                    CustomPopupMenuItemData(label: "Report", onTap: () {}),
                    CustomPopupMenuItemData(label: "Share to", onTap: () {}),
                    CustomPopupMenuItemData(label: "Cancel", onTap: () {}),
                  ],
                ),
                //const Icon(Icons.more_horiz, color: Colors.white, size: 28),
              ],
            ),

            SizedBox(height: screenHeight * 0.02),

            // Bio
            Text(
              "Clay Artist",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: SizeConfig.getFont(16),
              ),
            ),
            SizedBox(height: screenHeight * 0.004),
            Text(
              "When Art Speaks, Value Grows",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: SizeConfig.getFont(14),
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: screenHeight * 0.008),

            // Link Row
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Icon(Icons.link, color: Colors.white, size: 16),
                  ),
                ),

                SizedBox(width: screenWidth * 0.012),
                Text(
                  "When Art Speaks, Value Grows",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: SizeConfig.getFont(14),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            SizedBox(height: screenHeight * 0.024),

            // Buttons Row
            Row(
              children: [
                // Follow Button
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 6),
                    ),
                    child: Text(
                      "Follow",
                      style: GoogleFonts.montserrat(
                        fontSize: SizeConfig.getFont(14),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.024),
                // Visit Store Button
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 6),
                    ),
                    child: Text(
                      "Visit Store",
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: SizeConfig.getFont(14),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                // Add People Icon Button
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.person_add_alt_1,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: SizeConfig.getFont(14),
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.002),
        Text(
          label,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: SizeConfig.getFont(12),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
