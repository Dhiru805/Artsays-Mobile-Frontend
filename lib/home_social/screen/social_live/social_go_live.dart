import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:artsays_app/constants/svg_asset_constant.dart';
import 'package:artsays_app/home_social/screen/social_live/social_post_live.dart';
import 'package:artsays_app/home_social/widget/custom_pop_up_menu.dart';
import 'package:artsays_app/home_social/widget/social_bottom_animation.dart';
import 'package:artsays_app/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialGoLive extends StatefulWidget {
  const SocialGoLive({super.key});

  @override
  State<SocialGoLive> createState() => _SocialGoLiveState();
}

class _SocialGoLiveState extends State<SocialGoLive>
    with SingleTickerProviderStateMixin {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late double screenWidth;
  late double screenHeight;

  int _currentIndex = 0;
  bool _showSecondScreen = false;

  void _toggleSecondScreen() {
    setState(() {
      _showSecondScreen = !_showSecondScreen;
    });
  }

  String? selectedCategory;
  final List<String> categories = [
    'Default stream key (RTMP, Variable)',
    'stream key (RTMP, Variable)',
    'Default stream key (RTMP, Variable)22',
  ];
  bool _obscureText = true;

  void _copyPassword() {
    if (_passwordController.text.isNotEmpty) {
      Clipboard.setData(ClipboardData(text: _passwordController.text));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password copied!'),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  // Clear password text
  void _resetPassword() {
    _passwordController.clear();
  }

  bool isLatence1 = false;
  bool isLatence2 = false;
  bool isLatence3 = false;

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
      body: Stack(
        children: [
          // First Screen Content
          AnimatedPositioned(
            duration: const Duration(milliseconds: 2000),
            curve: Curves.easeInOut,
            top: _showSecondScreen ? -screenHeight : 0,
            bottom: _showSecondScreen ? screenHeight : 0,
            left: 0,
            right: 0,
            child: _buildFirstScreenContent(),
          ),

          // Second Screen (ArtSaysScreen)
          AnimatedPositioned(
            duration: const Duration(milliseconds: 2000),
            curve: Curves.easeInOut,
            top: _showSecondScreen ? 0 : screenHeight,
            bottom: _showSecondScreen ? 0 : -screenHeight,
            left: 0,
            right: 0,
            child: _buildSecondScreen(),
          ),
        ],
      ),
      bottomNavigationBar: _showSecondScreen
          ? null
          : _buildBottomNavigationBar(),
    );
  }

  Widget _buildFirstScreenContent() {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth * 0.05,
                        right: screenWidth * 0.025,
                      ),
                      child: Container(
                        width: screenWidth * 0.1,
                        height: screenWidth * 0.1,
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
                        fontSize: screenWidth * 0.04,
                        fontFamily: "Poppins",
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.025),
                    Icon(
                      Icons.verified,
                      color: Colors.white,
                      size: screenWidth * 0.04,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: screenWidth * 0.05,
                    left: screenWidth * 0.025,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.people_alt,
                        color: Colors.white,
                        size: screenWidth * 0.04,
                      ),
                      SizedBox(width: screenWidth * 0.012),
                      Text(
                        '35k',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: screenWidth * 0.035,
                          fontFamily: "Poppins",
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.025),
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
                    padding: EdgeInsets.symmetric(),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: screenHeight * 0.80,
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
                                  top: screenHeight * 0.02,
                                  left: screenWidth * 0.02,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.03,
                                      vertical: screenHeight * 0.008,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(
                                        screenWidth * 0.04,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: screenWidth * 0.02,
                                          height: screenWidth * 0.02,
                                          decoration: const BoxDecoration(
                                            color: Colors.red,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        SizedBox(width: screenWidth * 0.01),
                                        Text(
                                          'Live',
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
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: screenHeight * 0.2,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Colors.black.withOpacity(0.8),
                                          Colors.transparent,
                                        ],
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth * 0.03,
                                        vertical: screenHeight * 0.01,
                                      ),
                                      child: SingleChildScrollView(
                                        reverse: true,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            _buildComment(
                                              'art_lover',
                                              'So talented! ❤️',
                                            ),
                                            _buildComment(
                                              'creative_soul',
                                              'What materials are you using?',
                                            ),
                                            _buildComment(
                                              'creative_soul',
                                              'What materials are you using?',
                                            ),
                                            _buildComment(
                                              'creative_soul',
                                              'What materials are you using?',
                                            ),
                                            _buildComment(
                                              'creative_soul',
                                              'What materials are you using?',
                                            ),
                                            _buildComment(
                                              'creative_soul',
                                              'What materials are you using?',
                                            ),
                                            _buildComment(
                                              'creative_soul',
                                              'What materials are you using?',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
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
    );
  }

  Widget _buildSecondScreen() {
    return Scaffold(
      backgroundColor: ColorConstant.white,
      body: Column(
        children: [
          // Header with downward arrow
          SafeArea(child: _buildBottomNavigationBar()),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.010,
              ),
              child: Container(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Title",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 2),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),

                        child: _buildInputField(
                          hintText: 'Vikas Khanna',
                          hintColor: const Color(0xFF555555),
                          controller: titleController,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          borderRadius: 40,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 15,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Category",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 2),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),

                        child: _buildInputField(
                          hintText: 'Arts and Art Products',
                          hintColor: const Color(0xFF555555),
                          controller: titleController,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          borderRadius: 40,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 15,
                          ),
                        ),
                      ),

                      SizedBox(height: 20),
                      Text(
                        "Viewers waiting",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 2),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),

                        child: _buildInputField(
                          hintText: '200',
                          hintColor: const Color(0xFF555555),
                          controller: titleController,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          borderRadius: 40,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 15,
                          ),
                        ),
                      ),

                      SizedBox(height: 20),
                      Text(
                        "Privacy",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 2),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),

                        child: _buildInputField(
                          hintText: 'Public',
                          hintColor: const Color(0xFF555555),
                          controller: titleController,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          borderRadius: 40,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 15,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      _buildSection(
                        title: 'Stream key',
                        subtitle: 'Select stream key',
                        children: [
                          Container(
                            width: double.infinity,
                            height: 50,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 2,
                            ),
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.grey[600]!),
                            //   borderRadius: BorderRadius.circular(30),
                            // ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedCategory,
                                hint: Text(
                                  'Select a category',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Colors.black,
                                  size: 40,
                                ),
                                isExpanded: true,
                                items: categories.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
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
                      SizedBox(height: 20),
                      Text(
                        "Stream key (paste in encoder)",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: ColorConstant.orange,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      Row(
                        children: [
                          // Password Input
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.black, // underline color
                                    width: 1, // underline thickness
                                  ),
                                ),
                              ),
                              child: TextField(
                                controller: _passwordController,
                                obscureText: _obscureText,
                                decoration: const InputDecoration(
                                  hintText: 'Enter your password',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),

                          // Show / Hide Icon
                          IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey[700],
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                          ElevatedButton(
                            onPressed: _resetPassword,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorConstant.lightPink,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 13,
                                vertical: 4,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: const BorderSide(
                                  // 👈 adds border color
                                  color: ColorConstant
                                      .backgroundColor, // change to your preferred color
                                  width: 0.5,
                                ),
                              ),
                            ),
                            child: const Text(
                              "Reset",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: _copyPassword,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorConstant.lightPink,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 13,
                                vertical: 4,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: const BorderSide(
                                  // 👈 adds border color
                                  color: ColorConstant
                                      .backgroundColor, // change to your preferred color
                                  width: 0.5,
                                ),
                              ),
                            ),
                            child: const Text(
                              "Copy",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),
                      Text(
                        "Stream URL",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: ColorConstant.orange,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),

                      Row(
                        children: [
                          // Wrap only SVG + TextField in Container with bottom border
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.black, // underline color
                                    width: 1, // underline thickness
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    SvgImageAssetConstant.orangeLockIcon,
                                    height: 20,
                                    width: 20,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: TextField(
                                      decoration: const InputDecoration(
                                        hintText:
                                            'rtmp://a.rtmp.youtube.com/live2',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),

                          // Copy Button (outside bottom border)
                          ElevatedButton(
                            onPressed: _copyPassword,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorConstant.lightPink,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 13,
                                vertical: 4,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: const BorderSide(
                                  color: ColorConstant.backgroundColor,
                                  width: 0.5,
                                ),
                              ),
                            ),
                            child: const Text(
                              "Copy",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            "Stream latency",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: ColorConstant.orange,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(width: 10),
                          SvgPicture.asset(
                            SvgImageAssetConstant.orangeQueIcon,
                            height: 20,
                            width: 20,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 1️⃣ Comments Section
                          Padding(
                            padding: const EdgeInsets.only(left: 20, bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Radio<bool>(
                                    value:
                                        true, // value assigned to this radio button
                                    groupValue:
                                        isLatence1, // controls which radio is selected
                                    activeColor: ColorConstant
                                        .orange, // selected (fill) color
                                    fillColor: WidgetStateProperty.all(
                                      ColorConstant.orange,
                                    ), // optional, same as activeColor
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isLatence1 = value ?? false;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "Normal latency ",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 20, bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Radio<bool>(
                                    value:
                                        true, // value assigned to this radio button
                                    groupValue:
                                        isLatence2, // controls which radio is selected
                                    activeColor: ColorConstant
                                        .orange, // selected (fill) color
                                    fillColor: WidgetStateProperty.all(
                                      ColorConstant.orange,
                                    ), // optional, same as activeColor
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isLatence2 = value ?? false;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "Low latency ",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 20, bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Radio<bool>(
                                    value:
                                        true, // value assigned to this radio button
                                    groupValue:
                                        isLatence3, // controls which radio is selected
                                    activeColor: ColorConstant
                                        .orange, // selected (fill) color
                                    fillColor: WidgetStateProperty.all(
                                      ColorConstant.orange,
                                    ), // optional, same as activeColor
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isLatence3 = value ?? false;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "Ultra Low-latency ",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
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
              ),
            ),
          ),

          // Done Button at bottom
          Container(
            height: 70,
            color: ColorConstant.backgroundColor,
            //padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => SocialPostLive(),
                      //   ),
                      // );
                    },
                    child: Text(
                      "DONE",
                      style: TextStyle(
                        color: ColorConstant.backgroundColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 17,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

                // GestureDetector(
                //   onTap: () {
                //     setState(() {
                //       _selectedIndex = 2; // index of SocialAddScreen
                //     });
                //   }, // this button is + icon in bottaom navigation bar//
                //   child: SizedBox(
                //     height: 70,
                //     width: 74.94,
                //     child: Image.asset(ImageAssetConstant.addNavBarImage),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return SafeArea(
      child: Container(
        color: ColorConstant.backgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon 1
            InkWell(
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: SvgPicture.asset(
                  SvgImageAssetConstant.videoImage,
                  height: 40,
                  width: 40,
                ),
              ),
            ),

            // Icon 2
            InkWell(
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: SvgPicture.asset(
                  SvgImageAssetConstant.audioImage,
                  height: 40,
                  width: 40,
                ),
              ),
            ),

            // Icon 3
            InkWell(
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: SvgPicture.asset(
                  SvgImageAssetConstant.nextImage,
                  height: 40,
                  width: 40,
                ),
              ),
            ),

            // Icon 4
            InkWell(
              onTap: () {
                setState(() {
                  _currentIndex = 3;
                });
              },
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: SvgPicture.asset(
                  SvgImageAssetConstant.cameraturnImage,
                  height: 40,
                  width: 40,
                ),
              ),
            ),

            // End Stream Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SocialPostLive()),
                );
                // your action for the button
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: Text(
                "End Stream",
                style: TextStyle(
                  color: ColorConstant.backgroundColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ),

            // Upward Arrow - This triggers the animation
            InkWell(
              onTap: _toggleSecondScreen,
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: SvgPicture.asset(
                  _showSecondScreen
                      ? SvgImageAssetConstant.downwardarrowImage
                      : SvgImageAssetConstant.upwardarrowImage,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComment(String username, String message) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundImage: AssetImage(ImageAssetConstant.profileImage),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '$username ',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: message,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
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
              fontSize: 14,
            ),
          ),
        ],
        // const SizedBox(height: 12),
      ],
      ...children,
    ],
  );
}

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
