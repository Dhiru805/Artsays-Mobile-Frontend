import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/home_social/screen/social_live/social_go_live.dart';
import 'package:artsays_app/home_social/widget/social_bottom_animation.dart';
import 'package:artsays_app/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class SocialLiveCustomization extends StatefulWidget {
  const SocialLiveCustomization({super.key});

  @override
  State<SocialLiveCustomization> createState() =>
      _SocialLiveCustomizationState();
}

class _SocialLiveCustomizationState extends State<SocialLiveCustomization>
    with SingleTickerProviderStateMixin {
  String? selectedCategory;
  bool artSelected = true;

  bool isSwitched = false;

  bool isLatence1 = false;
  bool isLatence2 = false;
  bool isLatence3 = false;
  bool isLatence4 = false;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  late double screenWidth;
  late double screenHeight;

  // 🔹 Montserrat font styles for this screen
  final TextStyle customTitleStyle = const TextStyle(
    fontFamily: 'Montserrat',
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 26,
  );

  final TextStyle customSectionTitleStyle = const TextStyle(
    fontFamily: 'Montserrat',
    color: ColorConstant.orange,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );

  final TextStyle customTextStyle = const TextStyle(
    fontFamily: 'Montserrat',
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 12,
  );

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // backgroundColor: ColorConstant.backgroundColor,
      appBar: CustomAppBar(
        onNotificationTap: () {},
        title: '',
        fontFamily: '',
        centerTitle: false,
      ),
      body: Stack(
        children: [
          Container(color: ColorConstant.backgroundColor),

          Column(
            children: [
              // Header
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Customization", style: customTitleStyle),
                  Text(
                    "Settings to tailor your stream to your needs",
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: ColorConstant.white,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SocialBottomAnimation(
                  child: Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.01),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(screenWidth * 0.05),
                        topRight: Radius.circular(screenWidth * 0.05),
                      ),
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.04,
                            vertical: screenHeight * 0.010,
                          ),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: screenHeight * 0.02),
                                Text(
                                  "Comments",
                                  style: customSectionTitleStyle,
                                ),

                                SizedBox(height: screenHeight * 0.012),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: screenWidth * 0.02,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // 1️⃣ Comments Section
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: screenWidth * 0.05,
                                              bottom: screenHeight * 0.01,
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: screenWidth * 0.06,
                                                  height: screenWidth * 0.06,
                                                  child: Checkbox(
                                                    value: isLatence1,
                                                    activeColor:
                                                        ColorConstant.orange,
                                                    side: BorderSide(
                                                      color:
                                                          ColorConstant.orange,
                                                      width: 1.5,
                                                    ),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            screenWidth * 0.01,
                                                          ),
                                                    ),
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        isLatence1 =
                                                            value ?? false;
                                                      });
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: screenWidth * 0.02,
                                                ),
                                                Text(
                                                  "Live Chat",
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize:
                                                        screenWidth * 0.035,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: screenWidth * 0.05,
                                              bottom: screenHeight * 0.01,
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: screenWidth * 0.06,
                                                  height: screenWidth * 0.06,
                                                  child: Checkbox(
                                                    value: isLatence2,
                                                    activeColor:
                                                        ColorConstant.orange,
                                                    side: BorderSide(
                                                      color:
                                                          ColorConstant.orange,
                                                      width: 1.5,
                                                    ),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            screenWidth * 0.01,
                                                          ),
                                                    ),
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        isLatence2 =
                                                            value ?? false;
                                                      });
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: screenWidth * 0.02,
                                                ),
                                                Text(
                                                  "Live Chat Reply",
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize:
                                                        screenWidth * 0.035,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: screenWidth * 0.05,
                                              bottom: screenHeight * 0.01,
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: screenWidth * 0.06,
                                                  height: screenWidth * 0.06,
                                                  child: Checkbox(
                                                    value: isLatence3,
                                                    activeColor:
                                                        ColorConstant.orange,
                                                    side: BorderSide(
                                                      color:
                                                          ColorConstant.orange,
                                                      width: 1.5,
                                                    ),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            screenWidth * 0.01,
                                                          ),
                                                    ),
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        isLatence3 =
                                                            value ?? false;
                                                      });
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: screenWidth * 0.02,
                                                ),
                                                Text(
                                                  "Live Chat Summary",
                                                  style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontSize:
                                                        screenWidth * 0.035,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: screenHeight * 0.04),
                                Text(
                                  "Participant modes",
                                  style: customSectionTitleStyle,
                                ),
                                SizedBox(height: screenHeight * 0.004),
                                Text(
                                  "Who can send messages",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: screenWidth * 0.035,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.012),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: screenWidth * 0.02,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _radioRow("Anyone"),
                                      _radioRow("Subscriber"),
                                      _radioRow(
                                        "Live Commentary (approved user)",
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: screenHeight * 0.04),

                                Text(
                                  "Reactions",
                                  style: customSectionTitleStyle,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: screenWidth * 0.07,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Live reactions",
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: screenWidth * 0.035,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(width: screenWidth * 0.05),
                                      Transform.scale(
                                        scale: screenWidth * 0.002,
                                        child: Switch(
                                          value: isSwitched,
                                          activeColor: Colors.white,
                                          activeTrackColor:
                                              ColorConstant.orange,
                                          inactiveThumbColor: Colors.white,
                                          inactiveTrackColor:
                                              Colors.grey.shade400,
                                          onChanged: (bool value) {
                                            setState(() {
                                              isSwitched = value;
                                            });
                                          },
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
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(screenWidth * 0.07),
            topRight: Radius.circular(screenWidth * 0.07),
          ),
          color: ColorConstant.backgroundColor,
        ),
        height: screenHeight * 0.09,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(right: screenWidth * 0.05),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SocialGoLive(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.045,
                    vertical: screenHeight * 0.01,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                  ),
                ),
                child: Text(
                  "DONE",
                  style: TextStyle(
                    color: ColorConstant.backgroundColor,
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _radioRow(String title) {
    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 0.05,
        bottom: screenHeight * 0.01,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: screenWidth * 0.06,
            height: screenWidth * 0.06,
            child: Radio<bool>(
              value: true,
              groupValue: isLatence4,
              activeColor: ColorConstant.orange,
              fillColor: WidgetStateProperty.all(ColorConstant.orange),
              onChanged: (bool? value) {
                setState(() {
                  isLatence4 = value ?? false;
                });
              },
            ),
          ),
          SizedBox(width: screenWidth * 0.02),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: screenWidth * 0.035,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// 🔹 Section builder
Widget _buildSection({
  String? title,
  String? subtitle,
  required List<Widget> children,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (title != null) ...[
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            color: ColorConstant.orange,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ],
        const SizedBox(height: 12),
      ],
      ...children,
    ],
  );
}

// 🔹 Input Field builder
Widget _buildInputField({
  required TextEditingController controller,
  required String hintText,
  String? subHintText,
  Color textFillColor = ColorConstant.lightPink,
  bool textFillColorOpt = false,
  int maxLines = 1,
  Color textColor = Colors.white,
  Color hintColor = Colors.grey,
  double fontSize = 18,
  FontWeight fontWeight = FontWeight.bold,
  double borderRadius = 20,
  double hintfontsize = 18,
  EdgeInsetsGeometry contentPadding = const EdgeInsets.symmetric(
    vertical: 10,
    horizontal: 16,
  ),
}) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey[600]!, width: 0.1),
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    child: Stack(
      alignment: Alignment.centerLeft,
      children: [
        // Custom hint
        if (controller.text.isEmpty && subHintText != null)
          Padding(
            padding: contentPadding,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 2),
                Text(
                  subHintText,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: hintColor.withOpacity(0.8),
                    fontSize: fontSize,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),

        TextField(
          controller: controller,
          maxLines: maxLines,
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: hintfontsize,
              color: hintColor,
              fontWeight: FontWeight.bold,
            ),
            contentPadding: contentPadding,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              // borderSide: BorderSide(color: Colors.grey, width: 1.2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              // Orange focus color
            ),
            // border: InputBorder.none,
            filled: textFillColorOpt,
            fillColor: textFillColor,
          ),
        ),
      ],
    ),
  );
}
