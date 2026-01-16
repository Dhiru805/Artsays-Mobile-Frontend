import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onNotificationTap;
  const CustomAppBar({
    super.key,
    required String title,
    required String fontFamily,
    required bool centerTitle,
    required this.onNotificationTap,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0XFF48372D),
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // App Logo
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Image.asset(
              ImageAssetConstant.Artsayslogo,
              color: Colors.white,
              height: 35,
            ),
          ),

          // Notification Icon
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            color: Colors.white,
            iconSize: 24,
            onPressed: onNotificationTap,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
