// import 'package:artsays_app/constants/color_constant.dart';
// import 'package:artsays_app/constants/svg_asset_constant.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class AnimatedAppTitle extends StatefulWidget {
//   const AnimatedAppTitle({super.key});

//   @override
//   State<AnimatedAppTitle> createState() => _AnimatedAppTitleState();
// }

// class _AnimatedAppTitleState extends State<AnimatedAppTitle>
//     with TickerProviderStateMixin {
//   bool showLoader = true;
//   bool startTextAnimation = false;
//   bool showWhiteScreen = false;
//   bool _typingCompleted = false;

//   late AnimationController _typingController;
//   late Animation<int> _typingAnimation;
//   late AnimationController _growController;
//   late Animation<double> _scaleAnimation;
//   late Animation<double> _fadeAnimation;

//   final String text = "Artsays";

//   final List<String> loaderSvgs = [
//     SvgImageAssetConstant.titleCircle1,
//     SvgImageAssetConstant.titleCircle2,
//     SvgImageAssetConstant.titleCircle3,
//     SvgImageAssetConstant.titleCircle4,
//     SvgImageAssetConstant.titleCircle5,
//     SvgImageAssetConstant.titleCircle6,
//   ];

//   int loaderIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     _startLoaderSequence();

//     // Typing animation setup
//     final totalChars = text.length;
//     final totalSteps = totalChars + (totalChars - 1);

//     _typingController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 3),
//     );

//     _typingAnimation = StepTween(begin: 1, end: totalSteps).animate(
//       CurvedAnimation(parent: _typingController, curve: Curves.linear),
//     )..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           setState(() => _typingCompleted = true);
//           _startGrowing();
//         }
//       });

//     // Grow controller for centered "A"
//     _growController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     );

//     _scaleAnimation = Tween<double>(begin: 1, end: 140).animate(
//       CurvedAnimation(parent: _growController, curve: Curves.easeInOut),
//     );

//     _fadeAnimation = Tween<double>(begin: 1, end: 0).animate(
//       CurvedAnimation(
//         parent: _growController,
//         curve: const Interval(0.8, 1.0, curve: Curves.easeOut),
//       ),
//     );

//     _growController.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         Future.delayed(const Duration(milliseconds: 200), () {
//           setState(() => showWhiteScreen = true);
//         });
//       }
//     });
//   }

//   Future<void> _startLoaderSequence() async {
//     for (int i = 0; i < loaderSvgs.length; i++) {
//       setState(() => loaderIndex = i);
//       await Future.delayed(const Duration(milliseconds: 500));
//     }

//     await Future.delayed(const Duration(milliseconds: 400));
//     setState(() {
//       showLoader = false;
//       startTextAnimation = true;
//     });
//     _typingController.forward();
//   }

//   void _startGrowing() {
//     _growController.forward();
//   }

//   String get currentText {
//     if (!startTextAnimation) return "";
//     final totalChars = text.length;
//     final step = _typingAnimation.value;

//     if (step <= totalChars) {
//       return text.substring(0, step);
//     } else {
//       final backStep = step - totalChars;
//       return text.substring(0, totalChars - backStep);
//     }
//   }

//   @override
//   void dispose() {
//     _typingController.dispose();
//     _growController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (showWhiteScreen) {
//       return Container(color: Colors.white);
//     }

//     return Scaffold(
//       backgroundColor: ColorConstant.backgroundColor,
//       body: Center(
//         child: showLoader
//             ? Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   SvgPicture.asset(
//                     loaderSvgs[loaderIndex],
//                     width: 80,
//                     height: 80,
//                     fit: BoxFit.contain,
//                   ),
//                   const Text(
//                     "A",
//                     style: TextStyle(
//                       decoration: TextDecoration.none,
//                       fontFamily: 'Windhavi',
//                       fontSize: 60,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               )
//             : AnimatedBuilder(
//                 animation: Listenable.merge([_typingController, _growController]),
//                 builder: (context, child) {
//                   if (_typingCompleted) {
//                     // Growing centered "A"
//                     return Center(
//                       child: Opacity(
//                         opacity: _fadeAnimation.value,
//                         child: Transform.scale(
//                           scale: _scaleAnimation.value,
//                           alignment: Alignment.center,
//                           child: const Text(
//                             "A",
//                             style: TextStyle(
//                               decoration: TextDecoration.none,
//                               fontFamily: 'Windhavi',
//                               fontSize: 60,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   } else {
//                     // Typing animation
//                     return Text(
//                       currentText,
//                       style: const TextStyle(
//                         decoration: TextDecoration.none,
//                         fontFamily: 'Windhavi',
//                         fontSize: 60,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.white,
//                       ),
//                     );
//                   }
//                 },
//               ),
//       ),
//     );
//   }
// }


import 'package:artsays_app/carousel/artsays_slider.dart';
import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/svg_asset_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedAppTitle extends StatefulWidget {
  const AnimatedAppTitle({super.key});

  @override
  State<AnimatedAppTitle> createState() => _AnimatedAppTitleState();
}

class _AnimatedAppTitleState extends State<AnimatedAppTitle>
    with TickerProviderStateMixin {
  bool showLoader = true;
  bool startTextAnimation = false;
  bool showWhiteScreen = false;
  bool _typingCompleted = false;

  late AnimationController _typingController;
  late Animation<int> _typingAnimation;
  late AnimationController _growController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  final String text = "Artsays";

  final List<String> loaderSvgs = [
    SvgImageAssetConstant.titleCircle1,
    SvgImageAssetConstant.titleCircle2,
    SvgImageAssetConstant.titleCircle3,
    SvgImageAssetConstant.titleCircle4,
    SvgImageAssetConstant.titleCircle5,
    SvgImageAssetConstant.titleCircle6,
  ];

  int loaderIndex = 0;

  @override
  void initState() {
    super.initState();
    _startLoaderSequence();

    // Typing animation setup
    final totalChars = text.length;
    final totalSteps = totalChars + (totalChars - 1);

    _typingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _typingAnimation = StepTween(begin: 1, end: totalSteps).animate(
      CurvedAnimation(parent: _typingController, curve: Curves.linear),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() => _typingCompleted = true);
          _startGrowing();
        }
      });

    // Grow controller for centered "A"
    _growController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scaleAnimation = Tween<double>(begin: 1, end: 120).animate(
      CurvedAnimation(parent: _growController, curve: Curves.easeInOut),
    );

    _fadeAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _growController,
        curve: const Interval(0.8, 1.0, curve: Curves.easeOut),
      ),
    );

    _growController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        setState(() => showWhiteScreen = true);

        // Wait briefly to let white screen settle
        await Future.delayed(const Duration(milliseconds: 400));

        if (mounted) {
          // Smooth push replacement transition
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 800),
              pageBuilder: (_, __, ___) => const ImageSliderScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            ),
          );
        }
      }
    });
  }

  Future<void> _startLoaderSequence() async {
    for (int i = 0; i < loaderSvgs.length; i++) {
      setState(() => loaderIndex = i);
      await Future.delayed(const Duration(milliseconds: 500));
    }

    await Future.delayed(const Duration(milliseconds: 400));
    setState(() {
      showLoader = false;
      startTextAnimation = true;
    });
    _typingController.forward();
  }

  void _startGrowing() {
    _growController.forward();
  }

  String get currentText {
    if (!startTextAnimation) return "";
    final totalChars = text.length;
    final step = _typingAnimation.value;

    if (step <= totalChars) {
      return text.substring(0, step);
    } else {
      final backStep = step - totalChars;
      return text.substring(0, totalChars - backStep);
    }
  }

  @override
  void dispose() {
    _typingController.dispose();
    _growController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (showWhiteScreen) {
      return Container(color: Colors.white);
    }

    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      body: Center(
        child: showLoader
            ? Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    loaderSvgs[loaderIndex],
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                  const Text(
                    "A",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: 'Windhavi',
                      fontSize: 60,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            : AnimatedBuilder(
                animation: Listenable.merge([_typingController, _growController]),
                builder: (context, child) {
                  if (_typingCompleted) {
                    // Growing centered "A"
                    return Center(
                      child: Opacity(
                        opacity: _fadeAnimation.value,
                        child: Transform.scale(
                          scale: _scaleAnimation.value,
                          alignment: Alignment.center,
                          child: const Text(
                            "A",
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontFamily: 'Windhavi',
                              fontSize: 60,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    // Typing animation
                    return Text(
                      currentText,
                      style: const TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: 'Windhavi',
                        fontSize: 60,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    );
                  }
                },
              ),
      ),
    );
  }
}
