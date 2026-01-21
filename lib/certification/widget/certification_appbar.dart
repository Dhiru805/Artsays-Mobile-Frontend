import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:flutter/material.dart';

import '../../services/location_service/location_service.dart';

class CertificationAppbar extends StatefulWidget
    implements PreferredSizeWidget {
  final String city;
  const CertificationAppbar({super.key, required this.city});

  @override
  State<CertificationAppbar> createState() => _CertificationAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(110);
}

class _CertificationAppbarState extends State<CertificationAppbar> {
  String city = "Fetching...";

  @override
  void initState() {
    super.initState();
    fetchCity();
  }

  Future<void> fetchCity() async {
    final fetchedCity = await LocationService.getCityName();
    setState(() {
      city = fetchedCity;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ✅ Screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0XFF48372D),
      elevation: 0,

      // ✅ Rounded bottom corners (responsive)
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(screenWidth * 0.07),
          bottomRight: Radius.circular(screenWidth * 0.07),
        ),
      ),

      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Top Row (Logo + Location)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.02),
                  child: Image.asset(
                    ImageAssetConstant.Artsayslogo,
                    color: Colors.white,
                    height: screenHeight * 0.045,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.location_on_sharp),
                      color: Colors.white,
                      iconSize: screenWidth * 0.06,
                      onPressed: () {},
                    ),
                    Text(
                      widget.city,
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                  ],
                ),
              ],
            ),

            SizedBox(height: screenHeight * 0.005),

            // 🔹 Search Bar
            Container(
              height: screenHeight * 0.055,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(screenWidth * 0.05),
              ),
              child: Row(
                children: [
                  SizedBox(width: screenWidth * 0.03),
                  Icon(
                    Icons.search,
                    color: ColorConstant.backgroundColor,
                    size: screenWidth * 0.055,
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "Search here",
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.mic,
                    color: ColorConstant.backgroundColor,
                    size: screenWidth * 0.07,
                  ),
                  SizedBox(width: screenWidth * 0.02),
                ],
              ),
            ),

            SizedBox(height: screenHeight * 0.02),
          ],
        ),
      ),

      // ⬆️ Height based on screen height
      toolbarHeight: screenHeight * 0.14,
    );
  }
}
