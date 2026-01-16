import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/svg_asset_constant.dart';
import 'package:artsays_app/home_social/screen/social_live/social_live_cus.dart';
import 'package:artsays_app/home_social/widget/social_bottom_animation.dart';
import 'package:artsays_app/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialLiveDeatail extends StatefulWidget {
  const SocialLiveDeatail({super.key});

  @override
  State<SocialLiveDeatail> createState() => _SocialLiveDeatailState();
}

class _SocialLiveDeatailState extends State<SocialLiveDeatail>
    with SingleTickerProviderStateMixin {
  String? selectedCategory;
  bool artSelected = true;
  bool isChecked = false;
  bool isSwitched = false;
  String selectedSortOption = "Newest";
  List<String> sortOptions = ["Newest", "Oldest", "Most Popular"];
  final List<String> categories = [
    'Gaming',
    'Music',
    'Just Chatting',
    'Creative',
    'Education',
    'IRL',
  ];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  late double screenWidth;
  late double screenHeight;

  // 🔹 Montserrat font styles
  late TextStyle customTitleStyle;
  late TextStyle customSectionTitleStyle;
  late TextStyle customTextStyle;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    customTitleStyle = TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: screenWidth * 0.065,
    );

    customSectionTitleStyle = TextStyle(
      fontFamily: 'Montserrat',
      color: ColorConstant.orange,
      fontWeight: FontWeight.w600,
      fontSize: screenWidth * 0.045,
    );

    customTextStyle = TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: screenWidth * 0.03,
    );

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Details", style: customTitleStyle)],
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(screenWidth * 0.07),
                      topRight: Radius.circular(screenWidth * 0.07),
                    ),
                    color: ColorConstant.white,
                  ),
                  child: SocialBottomAnimation(
                    child: Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.01),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(screenWidth * 0.05),
                          topRight: Radius.circular(screenWidth * 0.05),
                        ),
                        child: Container(
                          // color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.04,
                              vertical: screenHeight * 0.01,
                            ),
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: screenHeight * 0.018),

                                  // Title Input
                                  Container(
                                    height: screenHeight * 0.05,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        screenWidth * 0.03,
                                      ),
                                    ),
                                    child: _buildInputField(
                                      hintText: 'Title',
                                      hintColor: const Color(0xFF555555),
                                      controller: titleController,
                                      fontSize: screenWidth * 0.045,
                                      fontWeight: FontWeight.bold,
                                      borderRadius: screenWidth * 0.08,
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: screenHeight * 0.01,
                                        horizontal: screenWidth * 0.04,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.02),

                                  // Description Input
                                  _buildInputField(
                                    hintText: "Description",
                                    subHintText:
                                        'Tell viewers more about your stream',
                                    controller: descriptionController,
                                    maxLines: 4,
                                    textColor: const Color(0xFF555555),
                                    hintColor: const Color(0xFF555555),
                                    fontSize: screenWidth * 0.03,
                                    fontWeight: FontWeight.bold,
                                    hintfontsize: screenWidth * 0.045,
                                  ),
                                  SizedBox(height: screenHeight * 0.03),

                                  // Category
                                  _buildSection(
                                    title: 'Category',
                                    subtitle:
                                        'Add your stream to a category so viewers can find it more easily',
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: screenHeight * 0.055,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth * 0.03,
                                          vertical: screenHeight * 0.004,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey[600]!,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            screenWidth * 0.07,
                                          ),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            value: selectedCategory,
                                            hint: Text(
                                              'Select a category',
                                              style: customTextStyle,
                                            ),
                                            icon: const Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color: Colors.black,
                                            ),
                                            isExpanded: true,
                                            items: categories.map((
                                              String value,
                                            ) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(
                                                  value,
                                                  style: customTextStyle,
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                selectedCategory = newValue;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: screenHeight * 0.03),

                                  // Thumbnail
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      // horizontal: screenWidth * 0.05,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Thumbnail",
                                          style: customSectionTitleStyle,
                                        ),
                                        SizedBox(height: screenHeight * 0.005),
                                        Text(
                                          "Select or upload a picture that represents your stream.",
                                          style: customTextStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.05),
                                  SvgPicture.asset(
                                    SvgImageAssetConstant.thumbnailImage,
                                    width: screenWidth * 0.5,
                                    height: screenHeight * 0.2,
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(height: screenHeight * 0.05),

                                  // Paid Promotion
                                  Text(
                                    "Paid Promotion",
                                    style: customSectionTitleStyle,
                                  ),
                                  SizedBox(height: screenHeight * 0.005),
                                  Text(
                                    "If you accepted anything of value from a third party to make stream, you must let us know. We’ll show viewers a message that your stream contains paid promotion.",
                                    style: customTextStyle,
                                  ),
                                  SizedBox(height: screenHeight * 0.02),

                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: screenWidth * 0.06,
                                        height: screenWidth * 0.06,
                                        child: Checkbox(
                                          value: isChecked,
                                          activeColor: ColorConstant.orange,
                                          checkColor: Colors.white,
                                          side: const BorderSide(
                                            color: ColorConstant.orange,
                                            width: 1,
                                          ),
                                          onChanged: (bool? value) {
                                            setState(() {
                                              isChecked = value ?? false;
                                            });
                                          },
                                        ),
                                      ),
                                      SizedBox(width: screenWidth * 0.02),
                                      Expanded(
                                        child: Text(
                                          "This stream contains paid promotion like a product,\n sponsorship or endorsement",
                                          style: customSectionTitleStyle
                                              .copyWith(
                                                fontSize: screenWidth * 0.03,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: screenHeight * 0.05),

                                  Text("Tags", style: customSectionTitleStyle),
                                  SizedBox(height: screenHeight * 0.005),
                                  Text(
                                    "Tags can be useful in your stream, tags play a minimal role in helping users find your stream.",
                                    style: customTextStyle,
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  _buildInputField(
                                    hintText:
                                        "Enter your tags (enter a comma after each tag)",
                                    hintColor: const Color(0xFF555555),
                                    controller: titleController,
                                    fontWeight: FontWeight.bold,
                                    borderRadius: screenWidth * 0.08,
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: screenHeight * 0.01,
                                      horizontal: screenWidth * 0.04,
                                    ),
                                    hintfontsize: screenWidth * 0.03,
                                    textFillColorOpt: true,
                                    textFillColor: ColorConstant.lightPink,
                                  ),

                                  SizedBox(height: screenHeight * 0.05),

                                  _buildSection(
                                    title: 'Language',
                                    subtitle: "Select your stream's language",
                                    children: [
                                      Container(
                                        width: screenWidth * 0.5,
                                        height: screenHeight * 0.055,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: screenWidth * 0.03,
                                          vertical: screenHeight * 0.004,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey[600]!,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            screenWidth * 0.07,
                                          ),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            value: selectedCategory,
                                            hint: Text(
                                              'Select',
                                              style: customTextStyle,
                                            ),
                                            icon: const Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color: Colors.black,
                                            ),
                                            isExpanded: true,
                                            items: categories.map((
                                              String value,
                                            ) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(
                                                  value,
                                                  style: customTextStyle,
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                selectedCategory = newValue;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: screenHeight * 0.05),

                                  Text(
                                    "License",
                                    style: customSectionTitleStyle,
                                    textAlign: TextAlign.center,
                                  ),

                                  SizedBox(height: screenHeight * 0.025),

                                  _buildInputField(
                                    hintText:
                                        "License \nStandard YouTube License",
                                    controller: descriptionController,
                                    maxLines: 3,
                                    textColor: Colors.black,
                                    hintColor: Colors.black,
                                    fontSize: screenWidth * 0.03,
                                    fontWeight: FontWeight.w600,
                                    hintfontsize: screenWidth * 0.03,
                                    textFillColorOpt: true,
                                    textFillColor: ColorConstant.lightPink,
                                  ),
                                  SizedBox(height: screenHeight * 0.04),

                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: screenWidth * 0.06,
                                        height: screenWidth * 0.06,
                                        child: Checkbox(
                                          value: isChecked,
                                          activeColor: ColorConstant.orange,
                                          checkColor: Colors.white,
                                          side: const BorderSide(
                                            color: ColorConstant.orange,
                                            width: 1,
                                          ),
                                          onChanged: (bool? value) {
                                            setState(() {
                                              isChecked = value ?? false;
                                            });
                                          },
                                        ),
                                      ),
                                      SizedBox(width: screenWidth * 0.02),
                                      Text(
                                        "Allow embedding",
                                        style: customSectionTitleStyle,
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: screenHeight * 0.05),

                                  Text(
                                    "Comments",
                                    style: customSectionTitleStyle,
                                  ),

                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Comments",
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: screenWidth * 0.035,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(width: screenWidth * 0.1),
                                          Text(
                                            isSwitched ? "ON" : "OFF",
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: screenWidth * 0.035,
                                              color: ColorConstant.orange,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Transform.scale(
                                            scale: 0.7,
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
                                      Row(
                                        children: [
                                          Text(
                                            "Sort by",
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: screenWidth * 0.035,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(width: screenWidth * 0.12),
                                          DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              value: selectedSortOption,
                                              icon: const Icon(
                                                Icons.keyboard_arrow_down,
                                                color: ColorConstant.orange,
                                              ),
                                              items: sortOptions.map((
                                                String value,
                                              ) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(
                                                    value,
                                                    style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      fontSize:
                                                          screenWidth * 0.035,
                                                      color:
                                                          ColorConstant.orange,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  selectedSortOption =
                                                      newValue!;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
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
                      builder: (context) => const SocialLiveCustomization(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.04,
                    vertical: screenHeight * 0.01,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),
                  ),
                ),
                child: Text(
                  "NEXT",
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
