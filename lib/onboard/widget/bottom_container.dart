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
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late AnimationController _exitController;
  bool _isExiting = false;

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

    // slightly slower exit animation for a smoother, more noticeable slide
    // increased from 800ms to 1000ms to slow the attached transition a bit
    _exitController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    // exit animation uses pixel translation (AnimatedBuilder + Transform)
    // so we only need the controller here.
  }

  @override
  void dispose() {
    _controller.dispose();
    _exitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use LayoutBuilder to get the container's height and translate it by that
    // height when exiting. AnimatedBuilder listens to the _exitController to
    // drive a pixel-perfect translation so the widget moves fully off screen.
    return LayoutBuilder(
      builder: (context, constraints) {
        return AnimatedBuilder(
          animation: _exitController,
          builder: (context, child) {
            // translate up by container height + a larger buffer and status bar
            // increased buffer to ensure smooth exit past top of screen
            final double buffer = 100.0;
            final double topPadding = MediaQuery.of(context).padding.top;
            final double translateY =
                -_exitController.value *
                (constraints.maxHeight + buffer + topPadding);

            return Transform.translate(
              offset: Offset(0, translateY),
              child: child,
            );
          },
          child: SlideTransition(
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
                        TextSpan(
                          text: "A space where creativity finds its voice.\n",
                        ),
                        TextSpan(
                          text: "Discover a platform made for artists,\n",
                        ),
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
                            _exitController.forward();
                            // Start a coordinated transition: the current container
                            // translates up (driven by _exitController) while the
                            // LoginPage slides in from the bottom using the route's
                            // animation. We start both so they appear attached.
                            Future.delayed(const Duration(milliseconds: 200), () {
                              Navigator.of(context).pushReplacement(
                                PageRouteBuilder(
                                  pageBuilder:
                                      (
                                        context,
                                        animation,
                                        secondaryAnimation,
                                      ) => const SignupScreen(),
                                  transitionDuration: const Duration(
                                    milliseconds: 1000,
                                  ),
                                  reverseTransitionDuration:
                                      _exitController.duration ??
                                      const Duration(milliseconds: 1500),
                                  transitionsBuilder:
                                      (
                                        context,
                                        animation,
                                        secondaryAnimation,
                                        child,
                                      ) {
                                        // Use easeOutCubic for a smoother acceleration/deceleration
                                        final curved = CurvedAnimation(
                                          parent: animation,
                                          curve: Curves.easeOutCubic,
                                        );
                                        final offsetAnim = Tween<Offset>(
                                          begin: const Offset(0, 1),
                                          end: Offset.zero,
                                        ).animate(curved);
                                        return SlideTransition(
                                          position: offsetAnim,
                                          child: child,
                                        );
                                      },
                                ),
                              );
                            });
                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const SignupScreen(),
                            //   ),
                            // );
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
                            // Prevent double taps while exiting
                            if (_isExiting) return;

                            setState(() {
                              _isExiting = true;
                            });
                            _exitController.forward();
                            // Start a coordinated transition: the current container
                            // translates up (driven by _exitController) while the
                            // LoginPage slides in from the bottom using the route's
                            // animation. We start both so they appear attached.
                            Future.delayed(const Duration(milliseconds: 200), () {
                              Navigator.of(context).pushReplacement(
                                PageRouteBuilder(
                                  pageBuilder:
                                      (
                                        context,
                                        animation,
                                        secondaryAnimation,
                                      ) => const LoginPage(),
                                  transitionDuration: const Duration(
                                    milliseconds: 1000,
                                  ),
                                  reverseTransitionDuration:
                                      _exitController.duration ??
                                      const Duration(milliseconds: 1500),
                                  transitionsBuilder:
                                      (
                                        context,
                                        animation,
                                        secondaryAnimation,
                                        child,
                                      ) {
                                        // Use easeOutCubic for a smoother acceleration/deceleration
                                        final curved = CurvedAnimation(
                                          parent: animation,
                                          curve: Curves.easeOutCubic,
                                        );
                                        final offsetAnim = Tween<Offset>(
                                          begin: const Offset(0, 1),
                                          end: Offset.zero,
                                        ).animate(curved);
                                        return SlideTransition(
                                          position: offsetAnim,
                                          child: child,
                                        );
                                      },
                                ),
                              );
                            });
                            // final route =
                            // Push replacement so the incoming page animates in while
                            // this container animates out.
                            // Navigator.of(context).pushReplacement(route);
                            // Play the exit animation (translate this container up)
                            // concurrently.
                            // _exitController.forward();
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
          ),
        );
      },
    );
  }
}
