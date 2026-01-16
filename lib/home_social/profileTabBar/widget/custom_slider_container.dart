import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:artsays_app/home_social/widget/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSliderContainer extends StatefulWidget {
  const CustomSliderContainer({super.key});

  @override
  State<CustomSliderContainer> createState() => _CustomSliderContainerState();
}

class _CustomSliderContainerState extends State<CustomSliderContainer>
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
                const SizedBox(width: 16),
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
                      const SizedBox(height: 12),
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

            const SizedBox(height: 20),

            // Bio
            Text(
              "Clay Artist",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "When Art Speaks, Value Grows",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),

            const SizedBox(height: 8),

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
                SizedBox(width: 6),
                Text(
                  "When Art Speaks, Value Grows",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

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
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
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
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
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
