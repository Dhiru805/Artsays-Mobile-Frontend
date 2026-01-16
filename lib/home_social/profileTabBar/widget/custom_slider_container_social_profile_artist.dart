import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:artsays_app/home_social/widget/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSliderContainerSocialProfileArtist extends StatefulWidget {
  const CustomSliderContainerSocialProfileArtist({super.key});

  @override
  State<CustomSliderContainerSocialProfileArtist> createState() =>
      _CustomSliderContainerState();
}

class _CustomSliderContainerState
    extends State<CustomSliderContainerSocialProfileArtist>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late double screenWidth;
  late double screenHeight;

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
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
              children: [
                // Profile Image
                const CircleAvatar(
                  radius: 14,
                  backgroundImage: AssetImage(ImageAssetConstant.nehaShetty),
                ),
                const SizedBox(width: 5),
                // Name and Stats
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Neha Shetty",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                CustomPopupMenu(
                  iconDir: "vertical",
                  items: [
                    CustomPopupMenuItemData(label: "Block", onTap: () {}),
                    CustomPopupMenuItemData(label: "Report", onTap: () {}),
                    CustomPopupMenuItemData(label: "Share to", onTap: () {}),
                    CustomPopupMenuItemData(label: "Cancel", onTap: () {}),
                  ],
                ),
                //const Icon(Icons.more_horiz, color: Colors.white, size: 28),
              ],
            ),

            // Bio
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
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
