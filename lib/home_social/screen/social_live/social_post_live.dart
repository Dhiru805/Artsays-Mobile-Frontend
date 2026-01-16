import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:artsays_app/constants/svg_asset_constant.dart';
import 'package:artsays_app/home_social/screen/social_live/social_live_publish.dart';
import 'package:artsays_app/home_social/widget/custom_pop_up_menu.dart';
import 'package:artsays_app/home_social/widget/social_bottom_animation.dart';
import 'package:artsays_app/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pie_chart/pie_chart.dart';

class SocialPostLive extends StatefulWidget {
  const SocialPostLive({super.key});

  @override
  State<SocialPostLive> createState() => _SocialPostLiveState();
}

class _SocialPostLiveState extends State<SocialPostLive>
    with SingleTickerProviderStateMixin {
  // store screen dimensions as state fields so they can be reused throughout the widget
  late double screenWidth;
  late double screenHeight;

  final statsData = [
    {'country': 'India', 'value': 75},
    {'country': 'US', 'value': 80},
    {'country': 'UK', 'value': 60},
  ];

  // Data for top locations (right column)
  final locationData = [
    {'country': 'Peak live Viewers', 'count': 145},
    {'country': 'Shares', 'count': 80},
    {'country': 'New Followers Gained', 'count': 60},
    {'country': 'Art work sold', 'count': 60},
  ];

  final Map<String, double> dataMap = {
    "Gifts": 75,
    "Featured Product": 70,
    "Super Stickers": 50,
  };

  // Custom Colors
  final colorList = <Color>[
    const Color.fromARGB(255, 112, 73, 50), // India
    ColorConstant.lightPink, // US
    const Color.fromARGB(255, 204, 129, 104), // UK
  ];

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      appBar: CustomAppBar(
        onNotificationTap: () {},
        title: '',
        fontFamily: '',
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: screenWidth * 0.05, // 5% of screen width
                      right: screenWidth * 0.025, // 2.5% of screen width
                    ),
                    child: Container(
                      width: screenWidth * 0.1, // 10% of screen width
                      height: screenWidth * 0.1, // keep it square
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          ImageAssetConstant.profileImage,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'artmaine_official',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      fontFamily: "Poppins",
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.verified,
                    color: Colors.white,
                    size: screenWidth * 0.04,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.people_alt,
                      color: Colors.white,
                      size: screenWidth * 0.04,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '35k',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        fontFamily: "Poppins",
                      ),
                    ),
                    SizedBox(width: 10),
                    // Icon(
                    //   Icons.more_vert,
                    //   color: Colors.white,
                    //   size: screenWidth * 0.06,
                    // ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: CustomPopupMenu(
                        iconDir: "horizontal",
                        items: [
                          CustomPopupMenuItemData(
                            label: "Hide Chat",
                            onTap: () {
                              print("Added");
                            },
                          ),
                          CustomPopupMenuItemData(
                            label: "Share Live",
                            onTap: () {
                              print("Following");
                            },
                          ),
                          CustomPopupMenuItemData(
                            label: "Report Stream",
                            onTap: () {
                              print("Reported");
                            },
                          ),
                          CustomPopupMenuItemData(
                            label: "Block Artist",
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

          Expanded(
            child: SocialBottomAnimation(
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.01),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(screenWidth * 0.05),
                  child: Container(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // LIVE Image
                          Container(
                            width: double.infinity,
                            height: screenHeight * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                screenWidth * 0.025,
                              ),
                              image: DecorationImage(
                                image: AssetImage(ImageAssetConstant.liveImage),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: screenHeight * 0.015,
                                  right: screenWidth * 0.03,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.03,
                                      vertical: screenHeight * 0.01,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(
                                        screenWidth * 0.012,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(width: screenWidth * 0.01),
                                        Text(
                                          '30:15',
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.035,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: screenHeight * 0.012),

                          // Description Box
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.05,
                            ),
                            child: Container(
                              height: screenHeight * 0.12,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFEE2CC),
                                borderRadius: BorderRadius.circular(
                                  screenWidth * 0.037,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(screenWidth * 0.02),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "25k Views",
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.035,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: screenHeight * 0.01),
                                    Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt sed do eiusmod tempor incididunt ut ....more",
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.027,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: screenHeight * 0.012),

                          // Left and Right Containers Row
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.05,
                            ),
                            child: Row(
                              children: [
                                // Left container
                                Container(
                                  height: screenHeight * 0.18,
                                  width: screenWidth * 0.30,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFC4C4C4),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                        screenWidth * 0.037,
                                      ),
                                      bottomLeft: Radius.circular(
                                        screenWidth * 0.037,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          SvgImageAssetConstant.addgallaryIcon,
                                        ),
                                        Text(
                                          "Drag photos and videos\n here",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: screenWidth * 0.022,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: screenHeight * 0.01),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "browse",
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: screenWidth * 0.025,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            SizedBox(
                                              width: screenWidth * 0.012,
                                            ),
                                            SvgPicture.asset(
                                              SvgImageAssetConstant.uploadIcon,
                                              height: screenWidth * 0.03,
                                              width: screenWidth * 0.03,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // Right container
                                Expanded(
                                  child: Container(
                                    height: screenHeight * 0.18,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFEE2CC),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(
                                          screenWidth * 0.037,
                                        ),
                                        bottomRight: Radius.circular(
                                          screenWidth * 0.037,
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                        screenWidth * 0.02,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Featured Product Title",
                                            style: TextStyle(
                                              color: const Color(0xFF504D4D),
                                              fontSize: screenWidth * 0.035,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            "00.00",
                                            style: TextStyle(
                                              color: const Color(0xFF504D4D),
                                              fontSize: screenWidth * 0.03,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: screenHeight * 0.012,
                                              right: screenWidth * 0.01,
                                            ),
                                            child: Container(
                                              height: screenHeight * 0.04,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      screenWidth * 0.012,
                                                    ),
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Add Product Description",
                                                  style: TextStyle(
                                                    fontSize:
                                                        screenWidth * 0.022,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: screenHeight * 0.018,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(
                                              screenWidth * 0.012,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Paste link here",
                                                  style: TextStyle(
                                                    fontSize:
                                                        screenWidth * 0.035,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color(
                                                      0xFF504D4D,
                                                    ),
                                                  ),
                                                ),
                                                Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  size: screenWidth * 0.05,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: screenHeight * 0.012),

                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: Container(
                              // let container height wrap content
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xFFFEE2CC),
                                borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * 0.037,
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min, // wrap content
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left:
                                          MediaQuery.of(context).size.width *
                                          0.03,
                                      right:
                                          MediaQuery.of(context).size.width *
                                          0.03,
                                      top:
                                          MediaQuery.of(context).size.height *
                                          0.025,
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Left Icon
                                        SvgPicture.asset(
                                          SvgImageAssetConstant.ellipseIcon,
                                          height:
                                              MediaQuery.of(
                                                context,
                                              ).size.height *
                                              0.07,
                                          width:
                                              MediaQuery.of(
                                                context,
                                              ).size.width *
                                              0.1,
                                        ),

                                        SizedBox(
                                          width:
                                              MediaQuery.of(
                                                context,
                                              ).size.width *
                                              0.03,
                                        ),

                                        // Center Text
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              top: screenHeight * 0.01,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Select Sponsor",
                                                  style: TextStyle(
                                                    fontSize:
                                                        MediaQuery.of(
                                                          context,
                                                        ).size.width *
                                                        0.035,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xFF555555),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      MediaQuery.of(
                                                        context,
                                                      ).size.height *
                                                      0.006,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Sponsored",
                                                      style: TextStyle(
                                                        fontSize:
                                                            MediaQuery.of(
                                                              context,
                                                            ).size.width *
                                                            0.033,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(
                                                            context,
                                                          ).size.width *
                                                          0.013,
                                                    ),
                                                    SvgPicture.asset(
                                                      SvgImageAssetConstant
                                                          .orangeIcon,
                                                      height:
                                                          MediaQuery.of(
                                                            context,
                                                          ).size.height *
                                                          0.018,
                                                      width:
                                                          MediaQuery.of(
                                                            context,
                                                          ).size.width *
                                                          0.035,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(
                                                            context,
                                                          ).size.width *
                                                          0.02,
                                                    ),
                                                    Flexible(
                                                      child: Text(
                                                        "Sponsored site",
                                                        overflow: TextOverflow
                                                            .ellipsis, // prevent overflow
                                                        style: TextStyle(
                                                          fontSize:
                                                              MediaQuery.of(
                                                                context,
                                                              ).size.width *
                                                              0.033,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color(
                                                            0xFF504D4D,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                        // Right Icon
                                        Icon(
                                          Icons.keyboard_arrow_up_outlined,
                                          size:
                                              MediaQuery.of(
                                                context,
                                              ).size.width *
                                              0.12,
                                          color: ColorConstant.backgroundColor,
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height *
                                        0.02,
                                  ),

                                  // Button
                                  FractionallySizedBox(
                                    widthFactor:
                                        0.8, // button takes 80% of screen width
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            ColorConstant.backgroundColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                          ),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          vertical:
                                              MediaQuery.of(
                                                context,
                                              ).size.height *
                                              0.015,
                                        ),
                                      ),
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          "Paste sponsored link",
                                          style: TextStyle(
                                            color: Color(0xFFA2A2A2),
                                            fontSize:
                                                MediaQuery.of(
                                                  context,
                                                ).size.width *
                                                0.045,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: screenHeight * 0.02),

                          // Session Insights Section
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.05,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Session Insights",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: ColorConstant.orange,
                                    fontWeight: FontWeight.w600,
                                    fontSize: screenWidth * 0.045,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.02),
                                _buildTotalSection(),

                                SizedBox(height: screenHeight * 0.015),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // ===== Left Column - Statistics =====
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            "Statistics",
                                            style: TextStyle(
                                              fontSize: screenWidth * 0.045,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: screenHeight * 0.005,
                                          ),
                                          Text(
                                            "Top Locations",
                                            style: TextStyle(
                                              fontSize: screenWidth * 0.03,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          SizedBox(
                                            height: screenHeight * 0.005,
                                          ),
                                          for (var stat in statsData)
                                            Padding(
                                              padding: EdgeInsets.only(
                                                bottom: screenHeight * 0.005,
                                              ),
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    height:
                                                        screenHeight * 0.035,
                                                    decoration: BoxDecoration(
                                                      color: ColorConstant
                                                          .lightPink,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            screenWidth * 0.04,
                                                          ),
                                                    ),
                                                  ),
                                                  LayoutBuilder(
                                                    builder: (context, constraints) {
                                                      final width =
                                                          constraints.maxWidth *
                                                          ((stat['value']
                                                                  as int) /
                                                              100);
                                                      return Container(
                                                        height:
                                                            screenHeight *
                                                            0.035,
                                                        width: width,
                                                        decoration: BoxDecoration(
                                                          color: ColorConstant
                                                              .backgroundColor,
                                                          borderRadius: BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                  screenWidth *
                                                                      0.04,
                                                                ),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                  screenWidth *
                                                                      0.04,
                                                                ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  Positioned.fill(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth *
                                                                0.02,
                                                          ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Center(
                                                              child: Text(
                                                                stat['country']
                                                                    as String,
                                                                style: TextStyle(
                                                                  color:
                                                                      (stat['value']
                                                                              as int) <
                                                                          40
                                                                      ? Colors
                                                                            .brown
                                                                      : Colors
                                                                            .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                  right:
                                                                      screenWidth *
                                                                      0.02,
                                                                ),
                                                            child: Text(
                                                              "${stat['value']}",
                                                              style: TextStyle(
                                                                color: ColorConstant
                                                                    .backgroundColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: screenWidth * 0.03),

                                    // ===== Right Column - Top Locations =====
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Statistics",
                                            style: TextStyle(
                                              fontSize: screenWidth * 0.045,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: screenHeight * 0.01),
                                          for (var loc in locationData)
                                            Padding(
                                              padding: EdgeInsets.only(
                                                bottom: screenHeight * 0.01,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    flex: 4,
                                                    child: Text(
                                                      loc['country'] as String,
                                                      style: TextStyle(
                                                        fontSize:
                                                            screenWidth * 0.030,
                                                      ),
                                                      // prevents overflow
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      loc['count'].toString(),
                                                      style: TextStyle(
                                                        fontSize:
                                                            screenWidth * 0.035,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      textAlign:
                                                          TextAlign.right,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: screenHeight * 0.02),

                                // Revenue Pie Chart
                                Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Revenue Breakdown",
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.06,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      PieChart(
                                        dataMap: dataMap,
                                        animationDuration: const Duration(
                                          milliseconds: 800,
                                        ),
                                        chartRadius: screenWidth / 2.2,
                                        colorList: colorList,
                                        chartType: ChartType.disc,
                                        ringStrokeWidth: screenWidth * 0.08,
                                        chartLegendSpacing: screenWidth * 0.08,
                                        legendOptions: const LegendOptions(
                                          showLegends: false,
                                        ),
                                        chartValuesOptions: ChartValuesOptions(
                                          showChartValues: true,
                                          showChartValuesInPercentage: false,
                                          showChartValuesOutside: false,
                                          decimalPlaces: 0,
                                          showChartValueBackground: false,
                                          chartValueStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: screenWidth * 0.03,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
        ],
      ),
      bottomNavigationBar: Container(
        child: Container(
          height: 70,
          color: ColorConstant.backgroundColor,
          //padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => SocialLiveCustomization(),
                    //   ),
                    // );
                  },
                  child: Text(
                    "Delete",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstant.backgroundColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: Colors.white, // White border
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SocialLivePublish(),
                      ),
                    );
                  },
                  child: Text(
                    "Publish",
                    style: TextStyle(
                      color: ColorConstant.backgroundColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildTotalSection() {
  return Container(
    // width: double.infinity,
    child: Column(
      children: [
        // First row of metrics
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildMetricItem('Total', '102k'),
            _buildMetricItem('Super Srikers', '4k'),
            _buildMetricItem('Super Chat', '2k'),
          ],
        ),
        const SizedBox(height: 16),

        // Second row of metrics
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildMetricItem('Comments', '90K'),
            _buildMetricItem('Memberships', '140K'),
            _buildMetricItem('Follows', '95k'),
          ],
        ),
        const SizedBox(height: 16),

        // Second row of metrics
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildMetricItem('Likes', '90K'),
            _buildMetricItem('In App Gifting', '140K'),
            _buildMetricItem('Total Earnings', '95k'),
          ],
        ),
        const SizedBox(height: 20),
      ],
    ),
  );
}

Widget _buildMetricItem(String title, String value) {
  return Column(
    children: [
      Container(
        width: 116,
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black, // Border color
            width: 1, // Border width
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(5.5),
            topRight: Radius.circular(5.5),
            bottomRight: Radius.circular(8.8),
            bottomLeft: Radius.circular(8.8),
          ),
        ),
        // padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              color: ColorConstant
                  .backgroundColor, // Background color only for title area
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5.5),
                  topRight: Radius.circular(5.5),
                ),
              ),
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
