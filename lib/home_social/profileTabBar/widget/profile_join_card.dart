import 'package:artsays_app/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileJoinCard extends StatelessWidget {
  final String image;
  final String title;
  final String username;
  final VoidCallback onJoin;
  final VoidCallback? onClose;

  const ProfileJoinCard({
    super.key,
    required this.image,
    required this.title,
    required this.username,
    required this.onJoin,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.28, // responsive width for 3 per row
      padding: EdgeInsets.all(screenWidth * 0.025),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF5EB), // inside background
        borderRadius: BorderRadius.circular(screenWidth * 0.035),
        border: Border.all(color: ColorConstant.backgroundColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // top section (image + title + username)
          Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: onClose,
                  child: Icon(Icons.close, size: screenWidth * 0.035),
                ),
              ),
              SizedBox(height: screenHeight * 0.005),

              CircleAvatar(
                radius: screenWidth * 0.07,
                backgroundImage: AssetImage(image),
              ),

              SizedBox(height: screenHeight * 0.01),

              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700,
                  fontSize: screenWidth * 0.028,
                  color: ColorConstant.backgroundColor,
                ),
              ),

              SizedBox(height: screenHeight * 0.004),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      username,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(
                        fontSize: screenWidth * 0.027,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.01),
                  Icon(
                    Icons.verified,
                    color: Colors.blue,
                    size: screenWidth * 0.035,
                  ),
                ],
              ),
            ],
          ),

          // join button (bottom)
          SizedBox(
            width: screenWidth * 0.2,
            height: screenHeight * 0.02,
            child: ElevatedButton(
              onPressed: onJoin,
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorConstant.backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.08),
                ),
                padding: EdgeInsets.zero,
              ),
              child: Text(
                "Join",
                style: GoogleFonts.montserrat(
                  fontSize: screenWidth * 0.026,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
