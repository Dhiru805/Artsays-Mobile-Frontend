import 'package:artsays_app/config/size_config.dart';
import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:artsays_app/constants/string_constant.dart';
import 'package:artsays_app/login/login.dart';
import 'package:artsays_app/onboard/widget/bottom_container.dart';
import 'package:artsays_app/shared/widgets/my_button.dart';
import 'package:flutter/material.dart';

class SellerScreen extends StatelessWidget {
  const SellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, //
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: SizeConfig.getHeight(350),
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorConstant.backgroundColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(62),
                  bottomRight: Radius.circular(62),
                ),
              ),

              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: TabBarView(
                        children: [
                          _buildImageWithBackButton(
                            context,
                            ImageAssetConstant.artistImage,
                            SizeConfig.getHeight(40),
                          ),

                          _buildImageWithBackButton(
                            context,
                            ImageAssetConstant.sellerImage,
                            SizeConfig.getHeight(40),
                          ),
                        ],
                      ),
                    ),
                  ),

                  TabBar(
                    dividerColor: Colors.transparent,
                    tabs: [
                      Tab(text: "Artist"),
                      Tab(text: "Seller"),
                    ],
                    indicator: CustomTabIndicator(),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: ColorConstant.backgroundColor,
                    unselectedLabelColor: Colors.white,
                    labelStyle: TextStyle(
                      fontSize: SizeConfig.getFont(20),
                      fontWeight: FontWeight.bold,
                    ),
                    labelPadding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.getWidth(15),
                      vertical: SizeConfig.getHeight(10),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(
                children: [
                  _buildArtistForm(context),
                  _buildSellerForm(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageWithBackButton(
    BuildContext context,
    String imagePath,
    double imageTopPadding,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: SizeConfig.getHeight(20),
            top: 30,
            left: 10,
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 24,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BottomContainer()),
              );
            },
          ),
        ),

        SizedBox(width: SizeConfig.getWidth(10)),

        Padding(
          padding: EdgeInsets.only(top: imageTopPadding),
          child: Image.asset(
            imagePath,
            height: SizeConfig.getHeight(300),
            width: SizeConfig.getWidth(300),
          ),
        ),
      ],
    );
  }

  Widget _buildArtistForm(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(top: SizeConfig.getHeight(20)),
          ),
          SizedBox(height: SizeConfig.getHeight(10)),
          Text(
            "New to Artsays?",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: SizeConfig.getFont(14),
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: SizeConfig.getHeight(10)),
          Text(
            "Create Account",
            style: TextStyle(
              color: Colors.black,
              fontSize: SizeConfig.getFont(25),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: SizeConfig.getHeight(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeConfig.getHeight(35),
                width: SizeConfig.getWidth(190),

                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: SizeConfig.getWidth(20)),
                      child: Icon(Icons.person, color: ColorConstant.grey),
                    ),
                    hintText: "First Name",
                    hintStyle: TextStyle(
                      color: ColorConstant.grey,
                      fontSize: SizeConfig.getFont(16),
                      fontWeight: FontWeight.w500,
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: ColorConstant.grey,
                        width: SizeConfig.getWidth(1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: ColorConstant.grey,
                        width: SizeConfig.getWidth(1),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              SizedBox(
                height: SizeConfig.getHeight(35),
                width: SizeConfig.getWidth(190),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: SizeConfig.getWidth(20)),
                      child: Icon(Icons.person, color: ColorConstant.grey),
                    ),
                    hintText: "Last Name",
                    hintStyle: TextStyle(
                      color: ColorConstant.grey,
                      fontSize: SizeConfig.getFont(16),
                      fontWeight: FontWeight.w500,
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: ColorConstant.grey,
                        width: SizeConfig.getWidth(1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: ColorConstant.grey,
                        width: SizeConfig.getWidth(1),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.getHeight(8)),
          SizedBox(
            height: SizeConfig.getHeight(35),
            width: SizeConfig.getWidth(390),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.getWidth(20)),
                  child: Icon(Icons.person, color: ColorConstant.grey),
                ),
                hintText: "Business Name",
                hintStyle: TextStyle(
                  color: ColorConstant.grey,
                  fontSize: SizeConfig.getFont(16),
                  fontWeight: FontWeight.w500,
                ),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: SizeConfig.getHeight(8)),
          SizedBox(
            height: SizeConfig.getWidth(35),
            width: SizeConfig.getWidth(390),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.getWidth(20)),
                  child: Icon(Icons.call, color: ColorConstant.grey),
                ),
                hintText: "Email/Phone Number",
                hintStyle: TextStyle(
                  color: ColorConstant.grey,
                  fontSize: SizeConfig.getFont(16),
                  fontWeight: FontWeight.w500,
                ),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: SizeConfig.getHeight(8)),
          SizedBox(
            height: SizeConfig.getWidth(35),
            width: SizeConfig.getWidth(390),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.getWidth(20)),
                  child: Icon(Icons.lock, color: ColorConstant.grey),
                ),
                hintText: "Password",
                hintStyle: TextStyle(
                  color: ColorConstant.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.getHeight(8)),
          SizedBox(
            height: SizeConfig.getWidth(35),
            width: SizeConfig.getWidth(390),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.getWidth(20)),
                  child: Icon(Icons.lock, color: ColorConstant.grey),
                ),
                hintText: "Confirm Password",
                hintStyle: TextStyle(
                  color: ColorConstant.grey,
                  fontSize: SizeConfig.getFont(16),
                  fontWeight: FontWeight.w500,
                ),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.getHeight(40)),
          SizedBox(
            height: SizeConfig.getWidth(37),
            width: SizeConfig.getWidth(150),
            child: MyButton(
              onpressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const SellerScreen()),
                // );
              },
              color: ColorConstant.orange,
              text: StringConstant.signup,
              textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: SizeConfig.getFont(20),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.getHeight(40)),
          Row(
            children: <Widget>[
              const Expanded(
                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                  indent: 0,
                  endIndent: 20,
                ),
              ),
              Text(
                "Or Login With",
                style: TextStyle(
                  fontSize: SizeConfig.getFont(14),
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const Expanded(
                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                  indent: 20,
                  endIndent: 0,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                ImageAssetConstant.facebookLogo,
                height: SizeConfig.getHeight(39),
                width: SizeConfig.getWidth(39),
              ),
              Image.asset(
                ImageAssetConstant.googleLogo,
                height: SizeConfig.getHeight(30),
                width: SizeConfig.getWidth(30),
              ),
              Image.asset(
                ImageAssetConstant.appleLogoBlack,
                height: SizeConfig.getHeight(39),
                width: SizeConfig.getWidth(39),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.getHeight(20)),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Text(
              "Already have an account?",
              style: TextStyle(
                color: Colors.black,
                fontSize: SizeConfig.getFont(18),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Seller Form Widget
  Widget _buildSellerForm(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(top: SizeConfig.getHeight(20)),
          ),
          SizedBox(height: SizeConfig.getHeight(10)),
          Text(
            "New to Artsays?",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: SizeConfig.getFont(14),
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: SizeConfig.getHeight(10)),
          Text(
            "Create Account",
            style: TextStyle(
              color: Colors.black,
              fontSize: SizeConfig.getFont(25),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: SizeConfig.getHeight(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeConfig.getHeight(35),
                width: SizeConfig.getWidth(190),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: SizeConfig.getWidth(20)),
                      child: Icon(Icons.person, color: ColorConstant.grey),
                    ),
                    hintText: "First Name",
                    hintStyle: TextStyle(
                      color: ColorConstant.grey,
                      fontSize: SizeConfig.getFont(16),
                      fontWeight: FontWeight.w500,
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: ColorConstant.grey,
                        width: SizeConfig.getWidth(1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: ColorConstant.grey,
                        width: SizeConfig.getWidth(1),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: SizeConfig.getWidth(12)),

              SizedBox(
                height: SizeConfig.getHeight(35),
                width: SizeConfig.getWidth(190),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: SizeConfig.getWidth(20)),
                      child: Icon(Icons.person, color: ColorConstant.grey),
                    ),
                    hintText: "Last  Name",
                    hintStyle: TextStyle(
                      color: ColorConstant.grey,
                      fontSize: SizeConfig.getFont(16),
                      fontWeight: FontWeight.w500,
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: ColorConstant.grey,
                        width: SizeConfig.getWidth(1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: ColorConstant.grey,
                        width: SizeConfig.getWidth(1),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.getHeight(8)),
          SizedBox(
            height: SizeConfig.getWidth(35),
            width: SizeConfig.getWidth(390),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.getWidth(20)),
                  child: Icon(Icons.person, color: ColorConstant.grey),
                ),
                hintText: "Artist Name",
                hintStyle: TextStyle(
                  color: ColorConstant.grey,
                  fontSize: SizeConfig.getFont(16),
                  fontWeight: FontWeight.w500,
                ),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.getHeight(8)),
          SizedBox(
            height: SizeConfig.getWidth(35),
            width: SizeConfig.getWidth(390),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.getWidth(20)),
                  child: Icon(Icons.call, color: ColorConstant.grey),
                ),
                hintText: "Email/Phone Number",
                hintStyle: TextStyle(
                  color: ColorConstant.grey,
                  fontSize: SizeConfig.getFont(16),
                  fontWeight: FontWeight.w500,
                ),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.getHeight(8)),
          SizedBox(
            height: SizeConfig.getWidth(35),
            width: SizeConfig.getWidth(390),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.getWidth(20)),
                  child: Icon(Icons.lock, color: ColorConstant.grey),
                ),
                hintText: "Password",
                hintStyle: TextStyle(
                  color: ColorConstant.grey,
                  fontSize: SizeConfig.getFont(16),
                  fontWeight: FontWeight.w500,
                ),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.getHeight(8)),
          SizedBox(
            height: SizeConfig.getWidth(35),
            width: SizeConfig.getWidth(390),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.getWidth(20)),
                  child: Icon(Icons.lock, color: ColorConstant.grey),
                ),
                hintText: "Confirm Password",
                hintStyle: TextStyle(
                  color: ColorConstant.grey,
                  fontSize: SizeConfig.getFont(16),
                  fontWeight: FontWeight.w500,
                ),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: ColorConstant.grey,
                    width: SizeConfig.getWidth(1),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.getHeight(40)),
          SizedBox(
            height: SizeConfig.getHeight(37),
            width: SizeConfig.getWidth(150),

            child: MyButton(
              onpressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const SellerScreen()),
                // );
              },
              color: ColorConstant.orange,
              text: StringConstant.signup,
              textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: SizeConfig.getFont(18),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.getHeight(40)),
          Row(
            children: <Widget>[
              const Expanded(
                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                  indent: 0,
                  endIndent: 20,
                ),
              ),
              Text(
                "Or Login With",
                style: TextStyle(
                  fontSize: SizeConfig.getFont(14),
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const Expanded(
                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                  indent: 20,
                  endIndent: 0,
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.getHeight(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                ImageAssetConstant.facebookLogo,
                height: SizeConfig.getHeight(39),
                width: SizeConfig.getWidth(39),
              ),
              Image.asset(
                ImageAssetConstant.googleLogo,
                height: SizeConfig.getHeight(30),
                width: SizeConfig.getWidth(30),
              ),
              Image.asset(
                ImageAssetConstant.appleLogoBlack,
                height: SizeConfig.getHeight(39),
                width: SizeConfig.getWidth(39),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.getHeight(20)),

          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Text(
              "Already have an account?",
              style: TextStyle(
                color: Colors.black,
                fontSize: SizeConfig.getFont(18),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTabIndicator extends Decoration {
  final Color fillColor;
  final Color borderColor;
  final double borderWidth;

  CustomTabIndicator({
    this.fillColor = Colors.white,
    this.borderColor = ColorConstant.backgroundColor,
    this.borderWidth = 1,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomTabIndicatorPainter(
      fillColor: fillColor,
      borderColor: borderColor,
      borderWidth: borderWidth,
    );
  }
}

class _CustomTabIndicatorPainter extends BoxPainter {
  final Color fillColor;
  final Color borderColor;
  final double borderWidth;

  _CustomTabIndicatorPainter({
    required this.fillColor,
    required this.borderColor,
    this.borderWidth = 1.0,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = offset & configuration.size!;

    final Paint fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final Paint borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth
      ..isAntiAlias = true;

    if (offset.dx == 0) {
      final rrect = RRect.fromRectAndCorners(
        rect,
        bottomLeft: const Radius.circular(62),
      );

      canvas.drawRRect(rrect, fillPaint);
      canvas.drawRRect(rrect, borderPaint);
    } else {
      final rrect = RRect.fromRectAndCorners(
        rect,
        bottomRight: const Radius.circular(62),
      );

      canvas.drawRRect(rrect, fillPaint);
      canvas.drawRRect(rrect, borderPaint);
      if (borderColor != Colors.transparent) {
        canvas.drawRRect(rrect, borderPaint);
      }
    }
  }
}
