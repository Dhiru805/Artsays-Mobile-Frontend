import 'package:artsays_app/config/size_config.dart';
import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:artsays_app/ui/buyer/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../../constants/color_constant.dart';
import '../widgets/list_items.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool showCertificate = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = SizeConfig.screenWidth;
    final screenHeight = SizeConfig.screenHeight;

    // final double bottomSheetHeight = showCertificate ? screenHeight * 0.12 : 0;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          screenWidth * 0.02,
          screenWidth * 0.02,
          screenWidth * 0.02,
          screenHeight * 0.02, // space for logout button
        ),
        child: Column(
          children: [
            /// 4 buttons
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0x8BEFEEEE),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          myButton(
                            icon: FeatherIcons.package,
                            "Orders",
                                () {},
                            screenHeight,
                            screenWidth,
                          ),
                          SizedBox(width: screenWidth * 0.05),
                          myButton(
                            icon: FeatherIcons.heart,
                            "Wishlist",
                                () {},
                            screenHeight,
                            screenWidth,
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          myButton(
                            icon: Icons.headset_mic_outlined,
                            "Help",
                                () {},
                            screenHeight,
                            screenWidth,
                          ),
                          SizedBox(width: screenWidth * 0.05),
                          myButton(
                            icon2: ImageAssetConstant.communityIconImage,
                            "Community",
                                () {},
                            screenHeight,
                            screenWidth,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
                  /// My account
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
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      listItem(
                        "Payment Methods",
                        0,
                        screenWidth,
                        screenHeight,
                            () {},
                      ),
                      listItem(
                        "Manage Addresses",
                        1,
                        screenWidth,
                        screenHeight,
                            () {},
                      ),
                      listItem(
                        "Account Verification",
                        2,
                        screenWidth,
                        screenHeight,
                            () {
                          // setState(() {
                          //   showCertificate = !showCertificate;
                          // });
                        },
                      ),
                      listItem(
                        "Notification",
                        3,
                        screenWidth,
                        screenHeight,
                            () {},
                      ),
                      listItem("Coupons", 4, screenWidth, screenHeight, () {}),
                      listItem(
                        "Challenges",
                        5,
                        screenWidth,
                        screenHeight,
                            () {},
                      ),
                      listItem(
                        "Password Manager",
                        6,
                        screenWidth,
                        screenHeight,
                            () {},
                      ),
                      listItem(
                        "Account Security and Agreement",
                        7,
                        screenWidth,
                        screenHeight,
                            () {},
                      ),
                      listItem(
                        "Privacy Center",
                        8,
                        screenWidth,
                        screenHeight,
                            () {},
                      ),
                    ],
                  ),

                  /// Become An Artist
                  // 🔹 Title
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenHeight * 0.01,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Become An Artist",
                        style: TextStyle(
                          color: ColorConstant.orange,
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // 🔹 List Section
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      listItem(
                        "Sell on Artsays",
                        9,
                        screenWidth,
                        screenHeight,
                            () {},
                      ),
                    ],
                  ),


                  /// My Activity
                  // 🔹 Title
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenHeight * 0.01,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "My Activity",
                        style: TextStyle(
                          color: ColorConstant.orange,
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // 🔹 List Section
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      listItem(
                        "Reviews given",
                        9,
                        screenWidth,
                        screenHeight,
                            () {},
                      ),
                      listItem(
                        "Custom Request",
                        10,
                        screenWidth,
                        screenHeight,
                            () {},
                      ),
                      listItem(
                        "Milestones",
                        11,
                        screenWidth,
                        screenHeight,
                            () {},
                      ),
                    ],
                  ),


                  SizedBox(height: screenHeight * 0.02,),

                  /// Logout
                  SizedBox(
                    width: screenWidth * 0.9,
                    child: TextButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.0014,
                        ),
                        // backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(screenWidth * 0.5),
                          side: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.05,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),),
          ],
        ),
      ),

      // 🔹 Bottom Sheet
      // bottomSheet: showCertificate
      //     ? Container(
      //         decoration: const BoxDecoration(
      //           boxShadow: [
      //             BoxShadow(
      //               offset: Offset(0, -3),
      //               blurRadius: 10,
      //               color: Color(0x33000000),
      //             ),
      //           ],
      //         ),
      //         child: ClipRRect(
      //           borderRadius: const BorderRadius.only(
      //             topLeft: Radius.circular(20),
      //             topRight: Radius.circular(20),
      //           ),
      //           child: Container(
      //             color: Colors.white,
      //             padding: EdgeInsets.symmetric(
      //               vertical: screenHeight * 0.015,
      //               horizontal: 15,
      //             ),
      //             child: SocialBottomAnimation(
      //               child: Row(
      //                 children: [
      //                   Expanded(
      //                     child: ElevatedButton.icon(
      //                       onPressed: () {
      //                         debugPrint("Creating certificate");
      //                       },
      //                       icon: const Icon(
      //                         Icons.workspace_premium,
      //                         color: Colors.white,
      //                       ),
      //                       label: Text(
      //                         "Create Certification",
      //                         style: TextStyle(
      //                           color: Colors.white,
      //                           fontSize: screenWidth * 0.05,
      //                           fontWeight: FontWeight.w700,
      //                         ),
      //                       ),
      //                       style: ElevatedButton.styleFrom(
      //                         padding: EdgeInsets.symmetric(
      //                           vertical: screenHeight * 0.008,
      //                         ),
      //                         backgroundColor: ColorConstant.backgroundColor,
      //                         shape: RoundedRectangleBorder(
      //                           borderRadius: BorderRadius.circular(
      //                             screenWidth * 0.05,
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       )
      //     : null,
    );
  }
}
