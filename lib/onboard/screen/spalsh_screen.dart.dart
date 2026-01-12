import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:artsays_app/carousel/artsays_slider.dart';
import 'package:artsays_app/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool _showTagline = false;
  bool _showBottomSheet = false;

  void _onAnimationFinished() async {
    setState(() => _showTagline = true);

    await Future.delayed(const Duration(seconds: 1));

    if (mounted) {
      setState(() => _showBottomSheet = true); // trigger both animations
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      body: Center(
        child: AnimatedSlide(
          offset: _showBottomSheet ? const Offset(0, -0.1) : Offset.zero,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeOut,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'Artsays',
                    textStyle: const TextStyle(
                      fontFamily: 'Windhavi',
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    speed: Duration(milliseconds: 200),
                  ),
                ],
                totalRepeatCount: 1,
                pause: const Duration(milliseconds: 300),
                onFinished: _onAnimationFinished,
              ),
              const SizedBox(height: 10),
              AnimatedOpacity(
                opacity: _showTagline ? 1.0 : 0.0,
                duration: const Duration(seconds: 1),
                child: Text(
                  "When Art Speaks, Value Grows",
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    color: ColorConstant.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom sheet widget with slide animation
      bottomSheet: AnimatedSlide(
        offset: _showBottomSheet ? Offset(0, 0) : Offset(0, 1),
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOut,
        child: const ImageSliderScreen(),
      ),
    );
  }
}
