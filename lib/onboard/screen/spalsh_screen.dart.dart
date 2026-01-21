import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:artsays_app/carousel/artsays_slider.dart';
import 'package:artsays_app/config/size_config.dart';
import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/onboard/screen/spalsh_screen2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  final bool showAnimation, isEarlierLoggedIn;
  const SplashScreen({super.key, required this.showAnimation, required this.isEarlierLoggedIn});

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
  void initState() {
    super.initState();
    _showBottomSheet = !widget.showAnimation;
    _showTagline = !widget.showAnimation;
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
              if(!_showBottomSheet)
                AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'Artsays',
                    textStyle: TextStyle(
                      fontFamily: 'Windhavi',
                      fontSize: SizeConfig.getFont(50),
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    speed: Duration(milliseconds: 500),
                  ),
                ],
                totalRepeatCount: 1,
                pause: const Duration(milliseconds: 300),
                onFinished: _onAnimationFinished,
              ),
              SizedBox(height: SizeConfig.getHeight(10)),
              AnimatedOpacity(
                opacity: _showTagline ? 1.0 : 0.0,
                duration: const Duration(seconds: 1),
                child: Text(
                  "When Art Speaks, Value Grows",
                  style: GoogleFonts.montserrat(
                    fontSize: SizeConfig.getFont(14),
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
      bottomSheet: _showBottomSheet ? widget.isEarlierLoggedIn ? SplashScreen2() : const ImageSliderScreen() : null,
    );
  }
}
