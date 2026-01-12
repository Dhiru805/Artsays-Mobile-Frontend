import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:artsays_app/onboard/screen/spalsh_screen2.dart';
import 'package:flutter/material.dart';

class ImageSliderScreen extends StatefulWidget {
  const ImageSliderScreen({super.key});

  @override
  State<ImageSliderScreen> createState() => _ImageSliderScreenState();
}

class _ImageSliderScreenState extends State<ImageSliderScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;
  bool _showBottomSheet = false;

  final List<Map<String, String>> sliderData = [
    {
      "image": ImageAssetConstant.sliderImage1,
      "title": "Welcome to Artsays",
      "subtitle":
          "A space where creativity finds its voice.\n Discover a platform made for artists,\n   collectors, and dreamers. ",
    },
    {
      "image": ImageAssetConstant.sliderImage2,
      "title": "Create & Showcase",
      "subtitle":
          "Bring your ideas to life.\n Upload your artworks, tell your story, and let  \nyour creativity shine in front of a global\n audience.",
    },
    {
      "image": ImageAssetConstant.sliderImage3,
      "title": "Connect & Collaborate",
      "subtitle":
          "Grow with your community.\n Engage with fellow artists, collectors, and\n fans. Share knowledge, get inspired, and\n collaborate on new projects.",
    },
    {
      "image": ImageAssetConstant.sliderImage4,
      "title": "Collect & Support",
      "subtitle":
          "Celebrate art, empower artists.\n Find unique pieces, support independent\n creators, and become part of an ecosystem\n that keeps creativity alive.",
    },
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: sliderData.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              double topPadding;
              if (index == 0) {
                topPadding = 110 * (screenHeight / 896);
              } else if (index == 1) {
                topPadding = 25 * (screenHeight / 896);
              } else if (index == 2) {
                topPadding = 95 * (screenHeight / 896);
              } else {
                topPadding = 35 * (screenHeight / 896);
              }
              return Padding(
                padding: EdgeInsets.only(top: topPadding),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    sliderData[index]["image"]!,
                    width: screenWidth,
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: screenHeight * 0.33,
              decoration: BoxDecoration(
                color: ColorConstant.backgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(62),
                  topRight: Radius.circular(62),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.06,
                vertical: screenHeight * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(sliderData.length, (index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentIndex == index
                                ? Colors.white
                                : Colors.white38,
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  Text(
                    sliderData[currentIndex]["title"] ?? "",
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Text(
                    sliderData[currentIndex]["subtitle"] ?? "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 0.0338,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: screenHeight * 0.02,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (currentIndex > 0) {
                        setState(() {
                          currentIndex--;
                          _controller.animateToPage(
                            currentIndex,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        });
                      }
                    },
                    style:
                        ElevatedButton.styleFrom(
                          backgroundColor: ColorConstant.backgroundColor,
                          side: BorderSide.none,
                          elevation: 0,

                          foregroundColor: Colors.white,
                        ).copyWith(
                          overlayColor: WidgetStateProperty.all(
                            Colors.transparent,
                          ),
                          shadowColor: WidgetStateProperty.all(
                            Colors.transparent,
                          ),
                        ),
                    child: currentIndex == 0
                        ? const Text("SKIP>")
                        : const SizedBox.shrink(),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      if (currentIndex < sliderData.length - 1) {
                        setState(() {
                          currentIndex++;
                          _controller.animateToPage(
                            currentIndex,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        });
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SplashScreen2(),
                          ),
                        );
                      }
                    },
                    style:
                        ElevatedButton.styleFrom(
                          backgroundColor: ColorConstant.backgroundColor,
                          side: BorderSide.none,
                          elevation: 0,
                          foregroundColor: Colors.white,
                          iconAlignment: IconAlignment.end,
                        ).copyWith(
                          overlayColor: WidgetStateProperty.all(
                            Colors.transparent,
                          ),
                          shadowColor: WidgetStateProperty.all(
                            Colors.transparent,
                          ),
                        ),
                    child: const Text("NEXT>"),
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
