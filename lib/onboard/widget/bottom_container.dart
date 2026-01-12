import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/string_constant.dart';
import 'package:artsays_app/login/login.dart';
import 'package:artsays_app/shared/widgets/my_button.dart';
import 'package:artsays_app/signup/screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomContainer extends StatefulWidget {
  const BottomContainer({super.key});

  @override
  State<BottomContainer> createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Container(
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: ColorConstant.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(62),
            topRight: Radius.circular(62),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Welcome",
              style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: ColorConstant.orange,
              ),
            ),
            SizedBox(height: 10),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: GoogleFonts.montserrat(
                  color: Color(0XFF48372D),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(text: "A space where creativity finds its voice.\n"),
                  TextSpan(text: "Discover a platform made for artists,\n"),
                  TextSpan(text: "collectors, and dreamers."),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      side: BorderSide(color: ColorConstant.orange),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      StringConstant.signup,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: ColorConstant.orange,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 24),
                Expanded(
                  child: MyButton(
                    onpressed: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(seconds: 3),
                          pageBuilder: (context, animation, secondaryAnimation) {
                            return const LoginPage(); // must directly return your page
                          },
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                                // Slide from bottom to top
                                final offsetAnimation =
                                    Tween<Offset>(
                                      begin: const Offset(
                                        0,
                                        1,
                                      ), // start off screen (bottom)
                                      end: Offset.zero, // final position
                                    ).animate(
                                      CurvedAnimation(
                                        parent: animation,
                                        curve: Curves.linear,
                                      ),
                                    );

                                return SlideTransition(
                                  position: offsetAnimation,
                                  child: child,
                                );
                              },
                        ),
                      );
                    },
                    color: ColorConstant.orange,
                    text: 'Login',
                    textStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
