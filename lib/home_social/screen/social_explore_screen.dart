// ignore_for_file: avoid_print

import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:artsays_app/home_social/widget/custom_pop_up_menu.dart';
import 'package:artsays_app/home_social/widget/social_bottom_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialExploreScreen extends StatefulWidget {
  const SocialExploreScreen({super.key});

  @override
  State<SocialExploreScreen> createState() => _SocialExploreScreenState();
}

class _SocialExploreScreenState extends State<SocialExploreScreen>
    with SingleTickerProviderStateMixin {
  late double screenwidth;
  late double screenHeight;

  final List<String> iamgeAssets = [
    ImageAssetConstant.waterBoat,
    ImageAssetConstant.fieldBoat,
    ImageAssetConstant.grassField,

    ImageAssetConstant.fieldBoat,
    ImageAssetConstant.grassField,
    ImageAssetConstant.waterBoat,

    ImageAssetConstant.grassField,
    ImageAssetConstant.fieldBoat,
    ImageAssetConstant.waterBoat,

    ImageAssetConstant.grassField,
    ImageAssetConstant.waterBoat,
    ImageAssetConstant.fieldBoat,
  ];

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      body: SocialBottomAnimation(
        child: Container(
          width: screenwidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(screenwidth * 0.07),
              topRight: Radius.circular(screenwidth * 0.07),
            ),
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: MasonryGridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 3,
              mainAxisSpacing: 2,

              itemCount: iamgeAssets.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: ColorConstant.backgroundColor,
                    // explicitly make any border transparent
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        // borderRadius: BorderRadius.circular(8),
                        child: Image.asset(iamgeAssets[index]),
                      ),
                      // SizedBox(height: 2),
                      Container(
                        height: 20,
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Lorem ipsum",
                                style: GoogleFonts.montserrat(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Align(
                              alignment: Alignment.topLeft,
                              child: CustomPopupMenu(
                                iconDir: "vertical",
                                items: [
                                  CustomPopupMenuItemData(
                                    label: "Add to Wishlist",
                                    onTap: () {
                                      print("Added");
                                    },
                                  ),
                                  CustomPopupMenuItemData(
                                    label: "Follow",
                                    onTap: () {
                                      print("Following");
                                    },
                                  ),
                                  CustomPopupMenuItemData(
                                    label: "Report",
                                    onTap: () {
                                      print("Reported");
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
