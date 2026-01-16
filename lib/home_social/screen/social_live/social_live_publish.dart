// ignore_for_file: sort_child_properties_last

import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:artsays_app/constants/svg_asset_constant.dart';
import 'package:artsays_app/home_social/widget/social_bottom_animation.dart';
import 'package:artsays_app/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLivePublish extends StatefulWidget {
  const SocialLivePublish({super.key});

  @override
  State<SocialLivePublish> createState() => _SocialLivePublishState();
}

class _SocialLivePublishState extends State<SocialLivePublish>
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

  void _resetPassword() {
    _passwordController.clear();
  }

  bool isLatence1 = false;
  bool isLatence2 = false;
  bool isLatence3 = false;
  bool _showLikeImage = false;
  bool _showEmojiPopup = false;

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
          AnimatedPositioned(
            duration: const Duration(milliseconds: 2000),
            curve: Curves.easeInOut,
            top: _showSecondScreen ? -screenHeight : 0,
            bottom: _showSecondScreen ? screenHeight : 0,
            left: 0,
            right: 0,
            child: _buildFirstScreenContent(),
          ),

          Positioned(
            bottom: screenHeight * 0.01,
            left: screenWidth * 0.039,
            right: screenWidth * 0.039,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _reactionIcon(Icons.emoji_emotions, ColorConstant.orange),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _showLikeImage = true;
                    });

                    // hide it again after 1 second
                    Future.delayed(const Duration(seconds: 1), () {
                      if (mounted) {
                        setState(() {
                          _showLikeImage = false;
                        });
                      }
                    });
                  },
                  child: SvgPicture.asset(
                    SvgImageAssetConstant.thumbIconOrange,
                    height: screenWidth * 0.12,
                    width: screenWidth * 0.12,
                  ),
                ),
                // SvgPicture.asset(
                //   SvgImageAssetConstant.thumbIconOrange,
                //   width: screenWidth * 0.1,
                //   height: screenWidth * 0.1,
                // ),
              ],
            ),
          ),

          // Emoji popup
          if (_showEmojiPopup)
            Positioned(
              bottom: 0, // position above the bottom nav
              right: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: ColorConstant.backgroundColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _emojiButton("❤️"),
                    _emojiButton("😂"),
                    _emojiButton("😮"),
                    _emojiButton("😢"),
                    _emojiButton("🔥"),
                  ],
                ),
              ),
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
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.035,
                            vertical: screenHeight * 0.010,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              screenWidth * 0.03,
                            ),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          "Follow",
                          style: TextStyle(
                            color: ColorConstant.backgroundColor,
                            fontWeight: FontWeight.w700,
                            fontSize: screenWidth * 0.035,
                          ),
                        ),
                      ),
                      // SizedBox(width: screenWidth * 0.010),

                      // 👇 Popup Menu Button
                      PopupMenuButton<String>(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        icon: Icon(
                          Icons.more_vert,
                          color: Colors.white,
                          size: screenWidth * 0.06,
                        ),
                        onSelected: (value) {
                          if (value == 'hide_chat') {
                            print("Hide Chat clicked");
                          } else if (value == 'share_live') {
                            print("Share Live clicked");
                          } else if (value == 'report_stream') {
                            print("Report Stream clicked");
                          } else if (value == 'block_artist') {
                            print("Block Artist clicked");
                          }
                        },
                        itemBuilder: (BuildContext context) => [
                          PopupMenuItem(
                            height: 25,

                            value: 'hide_chat',
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Center(
                                  child: Text(
                                    'Hide Chat',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                Divider(
                                  height: 10,
                                  thickness: 0.5,
                                  indent: 8,
                                  endIndent: 8,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 'share_live',
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Center(
                                  child: Text(
                                    'Share Live',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                Divider(
                                  height: 5,
                                  thickness: 0.5,
                                  indent: 8,
                                  endIndent: 8,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 'report_stream',
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Center(
                                  child: Text(
                                    'Report Stream',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                Divider(
                                  height: 5,
                                  thickness: 0.5,
                                  indent: 8,
                                  endIndent: 8,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                          PopupMenuItem(
                            value: 'block_artist',
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Center(
                                  child: Text(
                                    'Block Artist',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                                Divider(
                                  height: 5,
                                  thickness: 0.5,
                                  indent: 8,
                                  endIndent: 8,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ],
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
                          GestureDetector(
                            onDoubleTap: () {
                              setState(() {
                                _showLikeImage = true;
                              });

                              Future.delayed(const Duration(seconds: 1), () {
                                if (mounted) {
                                  setState(() {
                                    _showLikeImage = false;
                                  });
                                }
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              height: screenHeight * 0.8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  screenWidth * 0.025,
                                ),
                                image: DecorationImage(
                                  image: AssetImage(
                                    ImageAssetConstant.liveImage,
                                  ),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: screenHeight * 0.02,
                                    left: screenWidth * 0.04,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth * 0.03,
                                        vertical: screenHeight * 0.008,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(
                                          screenWidth * 0.035,
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
                                  if (_showLikeImage)
                                    Positioned(
                                      top: 0,
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Center(
                                        child: SvgPicture.asset(
                                          SvgImageAssetConstant.thumbIconOrange,
                                          width: screenWidth * 0.18,
                                          height: screenWidth * 0.18,
                                        ),
                                      ),
                                    ),

                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      height: screenHeight * 0.22,
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
                                            ],
                                          ),
                                        ),
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
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _iconButton(IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.02),
      decoration: BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
      child: Icon(icon, color: color, size: screenWidth * 0.07),
    );
  }

  Widget _reactionIcon(IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.02),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: color, size: screenWidth * 0.07),
    );
  }

  Widget _buildBottomNavigationBar() {
    return SafeArea(
      child: Container(
        color: ColorConstant.backgroundColor,
        padding: EdgeInsets.only(
          top: screenHeight * 0.015,
          left: screenWidth * 0.04,
          right: screenWidth * 0.04,
          bottom: 0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Comment",
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w600,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.035,
                    vertical: screenHeight * 0.007,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.05),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.05),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.05),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  suffixIcon: Icon(
                    Icons.emoji_emotions,
                    color: Colors.white,
                    size: screenWidth * 0.07,
                  ),
                  suffixIconConstraints: BoxConstraints(
                    minWidth: screenWidth * 0.1,
                    minHeight: screenWidth * 0.1,
                  ),
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.03),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.all(4),
              child: InkWell(
                onTap: () {
                  _showSupportPopup(context);
                },
                child: Icon(
                  Icons.attach_money,
                  color: ColorConstant.orange,
                  size: 33,
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.02),
            InkWell(
              onTap: () {
                setState(() {
                  _showEmojiPopup = !_showEmojiPopup;
                });
              },
              borderRadius: BorderRadius.circular(screenWidth * 0.02),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                child: SvgPicture.asset(
                  SvgImageAssetConstant.heartIconOrange,
                  height: screenWidth * 0.1,
                  width: screenWidth * 0.1,
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
      margin: EdgeInsets.only(bottom: screenHeight * 0.01),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: screenWidth * 0.035,
            backgroundImage: AssetImage(ImageAssetConstant.profileImage),
          ),
          SizedBox(width: screenWidth * 0.02),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '$username ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                  TextSpan(
                    text: message,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _emojiButton(String emoji) {
    return GestureDetector(
      onTap: () {
        print("Emoji clicked: $emoji");
        setState(() {
          _showEmojiPopup = false; // hide after selecting
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        child: Text(emoji, style: const TextStyle(fontSize: 28)),
      ),
    );
  }

  void _showSupportPopup(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final bottomNavBarHeight =
        screenHeight * 0.08; // same as your bottom nav bar height

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor:
          Colors.transparent, // so inner rounded corners are visible
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: bottomNavBarHeight + 10, // hover above bottom nav
            left: 16,
            right: 16,
          ),
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: ColorConstant.backgroundColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 24),
                      const Text(
                        'Show support to Vikas_k',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Options
                  _popupItem(
                    context,
                    'Super Chat',
                    SvgImageAssetConstant.superChat,
                    () {
                      Navigator.pop(context);
                      _showSuperChatPopup(context);
                    },
                  ),
                  _popupItem(
                    context,
                    'Super Stickers',
                    SvgImageAssetConstant.superSticker,
                    () {
                      Navigator.pop(context);
                      _showSuperStickersPopup(context);
                    },
                  ),
                  _popupItem(
                    context,
                    'Membership',
                    SvgImageAssetConstant.superPeople,
                    () {
                      Navigator.pop(context);
                      _showMembershipPopup(context);
                    },
                  ),
                  _popupItem(
                    context,
                    'In App Gifting',
                    SvgImageAssetConstant.superGift,
                    () {
                      Navigator.pop(context);
                      _showInAppGiftingPopup(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _popupItem(
    BuildContext context,
    String title,
    String svgAssetPath,
    VoidCallback onTap,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.02), // ~8 px on 400px width
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(screenWidth * 0.07)),
        ),
        child: ListTile(
          onTap: onTap,
          leading: Container(
            // padding: EdgeInsets.all(screenWidth * 0.01),
            child: SvgPicture.asset(
              svgAssetPath,
              width: screenWidth * 0.08, // ~30 on 375–400px screens
              height: screenWidth * 0.08,
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: screenWidth * 0.045, // ~18 on 400px screen
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
            size: screenWidth * 0.045, // ~18
          ),
        ),
      ),
    );
  }

  void _showSuperChatPopup(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final bottomNavBarHeight =
        screenHeight * 0.08; // approximate height of bottom nav

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: bottomNavBarHeight + 10, // hover above bottom nav
            left: 16,
            right: 16,
          ),
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: ColorConstant.backgroundColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Top row with centered title and right close icon
                  Stack(
                    children: [
                      Center(
                        child: const Text(
                          'Super Chat',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            _showSupportPopup(context); // reopen previous popup
                          },
                          child: const Icon(Icons.close, color: Colors.white),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // First button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD6FFE1),
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.045,
                          vertical: screenHeight * 0.01,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width * 0.03,
                          ),
                        ),
                      ),
                      child: Text(
                        "Lucky Singh  ₹ 40.0",
                        style: TextStyle(
                          color: ColorConstant.backgroundColor,
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Amount text
                  Center(
                    child: Text(
                      "₹ 40.0",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.045,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Dotted line / spacer
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      ImageAssetConstant.superChatSpacer,
                      fit: BoxFit.fitWidth,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Buy and Send button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD6FFE1),
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.09,
                          vertical: screenHeight * 0.01,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width * 0.03,
                          ),
                        ),
                      ),
                      child: Text(
                        "Buy and Send",
                        style: TextStyle(
                          color: ColorConstant.backgroundColor,
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showSuperStickersPopup(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final bottomNavBarHeight =
        screenHeight * 0.08; // approximate bottom nav height

    List<String> stickerPngs = [
      ImageAssetConstant.skullImage,
      ImageAssetConstant.starImage,
      ImageAssetConstant.skullImage,
      ImageAssetConstant.starImage,
      ImageAssetConstant.skullImage,
      ImageAssetConstant.starImage,
      ImageAssetConstant.skullImage,
      ImageAssetConstant.starImage,
      ImageAssetConstant.skullImage,
      ImageAssetConstant.starImage,
      ImageAssetConstant.skullImage,
      ImageAssetConstant.starImage,
      ImageAssetConstant.skullImage,
      ImageAssetConstant.starImage,
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: bottomNavBarHeight + 10, // hover above bottom nav
            left: 16,
            right: 16,
          ),
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: ColorConstant.backgroundColor,
                borderRadius: BorderRadius.circular(screenWidth * 0.05),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.02,
                horizontal: screenWidth * 0.04,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Top row with centered title and right close icon
                  Stack(
                    children: [
                      Center(
                        child: Text(
                          'Super Stickers',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.045,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            _showSupportPopup(context); // reopen previous popup
                          },
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: screenWidth * 0.06,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  Column(
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 7, // 7 stickers in one row
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                            ),
                        itemCount: stickerPngs.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              print('Sticker ${index + 1} clicked');
                            },
                            child: Image.asset(
                              stickerPngs[index],
                              width: screenWidth * 0.1,
                              height: screenWidth * 0.1,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showMembershipPopup(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final bottomNavBarHeight =
        screenHeight * 0.08; // approximate bottom nav height

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: bottomNavBarHeight + 10, // hover above bottom nav
            left: 16,
            right: 16,
          ),
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: ColorConstant.backgroundColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.01,
                horizontal: screenWidth * 0.04,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: screenWidth * 0.06),
                      const Text(
                        "Buy Memberships",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                          _showSupportPopup(context);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),

                  // Profile & banner section
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage(
                              ImageAssetConstant.profileImage,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          const Text(
                            'Vikas',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          const Text(
                            'Be a member',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Image.asset(
                        ImageAssetConstant.memberBG,
                        fit: BoxFit.cover,
                        height: screenHeight * 0.12,
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),

                  // Membership rows
                  Column(
                    children: [
                      // SILVER
                      _membershipRow(
                        screenWidth,
                        screenHeight,
                        "SILVER",
                        "₹50/month",
                      ),
                      SizedBox(height: screenHeight * 0.002),
                      // GOLD
                      _membershipRow(
                        screenWidth,
                        screenHeight,
                        "GOLD",
                        "₹60/month",
                        hasButton: true,
                      ),
                      SizedBox(height: screenHeight * 0.002),
                      // PLATINUM
                      _membershipRow(
                        screenWidth,
                        screenHeight,
                        "PLATINUM",
                        "₹200/month",
                        extraText:
                            "Loyalty badges next to your \n name in comments \n and live chat",
                      ),
                      SizedBox(height: screenHeight * 0.002),
                      // PLATINUM+
                      _membershipRow(
                        screenWidth,
                        screenHeight,
                        "PLATINUM+",
                        "₹1000/month",
                        extraText:
                            "Loyalty badges next to your \n name in comments \n and live chat",
                      ),
                    ],
                  ),

                  SizedBox(height: screenHeight * 0.016),

                  // SVG icons row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(8, (index) {
                      return SizedBox(
                        width: screenWidth * 0.1,
                        height: screenWidth * 0.1,
                        child: SvgPicture.asset(
                          SvgImageAssetConstant.sticker1Svg,
                          fit: BoxFit.contain,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Helper function to reduce repetition for membership rows
  Widget _membershipRow(
    double screenWidth,
    double screenHeight,
    String title,
    String price, {
    bool hasButton = false,
    String? extraText,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(
            top: screenHeight * 0.008,
            bottom: screenHeight * 0.008,
            left: screenWidth * 0.04,
            right: screenWidth * 0.14,
          ),
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(price, style: const TextStyle(color: Colors.white70)),
            ],
          ),
        ),
        SizedBox(width: screenWidth * 0.02),
        if (hasButton)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.008,
                    horizontal: screenWidth * 0.04,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Join',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                ),
              ),
              if (extraText != null)
                Text(
                  extraText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 9,
                  ),
                ),
            ],
          )
        else if (extraText != null)
          Text(
            extraText,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          )
        else
          Text(
            price,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
          ),
      ],
    );
  }

  void _showInAppGiftingPopup(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final bottomNavBarHeight =
        screenHeight * 0.08; // approximate bottom nav height

    List<String> stickerPngs = [
      ImageAssetConstant.skullImage,
      ImageAssetConstant.starImage,
      ImageAssetConstant.skullImage,
      ImageAssetConstant.starImage,
      ImageAssetConstant.skullImage,
      ImageAssetConstant.starImage,
      ImageAssetConstant.skullImage,
      ImageAssetConstant.starImage,
      ImageAssetConstant.skullImage,
      ImageAssetConstant.starImage,
      ImageAssetConstant.skullImage,
      ImageAssetConstant.starImage,
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: bottomNavBarHeight + 10,
            left: 16,
            right: 16,
          ),
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: ColorConstant.backgroundColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.02,
                horizontal: screenWidth * 0.04,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header row
                  Stack(
                    children: [
                      Center(
                        child: const Text(
                          'In-App Gifting',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            _showSupportPopup(context);
                          },
                          child: const Icon(Icons.close, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // Stickers grid with icons, name, and coins
                  Column(
                    children: [
                      // First row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(6, (index) {
                          return GestureDetector(
                            onTap: () {
                              print('Sticker ${index + 1} clicked');
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  stickerPngs[index],
                                  width: screenWidth * 0.1,
                                  height: screenWidth * 0.1,
                                ),
                                // SizedBox(height: screenHeight * 0.005),
                                const Text(
                                  'Pookie Skull',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.002),
                                const Text(
                                  '199',
                                  style: TextStyle(
                                    color: Colors.yellowAccent,
                                    fontSize: 9,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: screenHeight * 0.02),

                      // Second row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(6, (index) {
                          return GestureDetector(
                            onTap: () {
                              print('Sticker ${index + 7} clicked');
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  stickerPngs[index + 6],
                                  width: screenWidth * 0.1,
                                  height: screenWidth * 0.1,
                                ),
                                SizedBox(height: screenHeight * 0.005),
                                const Text(
                                  'Pookie Skull',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.002),
                                const Text(
                                  '199',
                                  style: TextStyle(
                                    color: Colors.yellowAccent,
                                    fontSize: 9,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
