import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:artsays_app/config/size_config.dart';
import 'package:flutter/material.dart';

import '../../constants/color_constant.dart';

class SplashScreenAnimation extends StatefulWidget {
  const SplashScreenAnimation({super.key});

  @override
  State<SplashScreenAnimation> createState() => _SplashScreenAnimationState();
}

class _SplashScreenAnimationState extends State<SplashScreenAnimation>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _progressController;
  late AnimationController _typewriterController;
  late AnimationController _scaleController;

  late Animation<double> _fadeAnimation;
  late Animation<double> _progressAnimation;
  late Animation<double> _scaleAnimation;

  AnimationPhase _currentPhase = AnimationPhase.fadeIn;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startAnimationSequence();
  }

  void _setupAnimations() {
    // Phase 1: Fade in 'A' with progress bars (2 seconds)
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_fadeController);

    // Progress bars animation (2 seconds for one complete rotation)
    _progressController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _progressAnimation = Tween<double>(begin: 0, end: 1).animate(_progressController);

    // Phase 2: Typewriter animation (text typing)
    _typewriterController = AnimationController(
      duration: const Duration(milliseconds: 2800),
      vsync: this,
    );

    // Phase 3: Scale animation for 'A' (1 second)
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1, end: 8).animate(_scaleController);
  }

  void _startAnimationSequence() async {
    // Phase 1: Fade in 'A' and show progress bars
    setState(() {
      _currentPhase = AnimationPhase.fadeIn;
    });
    await _fadeController.forward();
    await _progressController.forward();

    // Phase 2: Type out 'Artsaya'
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      _currentPhase = AnimationPhase.typewriter;
    });
    await _typewriterController.forward();

    // Phase 3: Remove text and scale 'A'
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      _currentPhase = AnimationPhase.scale;
    });
    await _scaleController.forward();

    // Navigate to home
    if (mounted) {
      Navigator.of(context).pushReplacementNamed('/home');
    }
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _progressController.dispose();
    _typewriterController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Phase 1: 'A' with progress bars
            if (_currentPhase == AnimationPhase.fadeIn)
              _buildPhaseOne(),

            // Phase 2: 'A' with full text 'Artsaya'
            if (_currentPhase == AnimationPhase.typewriter)
              _buildPhaseTwo(),

            // Phase 3: Scaled 'A'
            if (_currentPhase == AnimationPhase.scale)
              ScaleTransition(
                scale: _scaleAnimation,
                child: const Text(
                  'A',
                  style: TextStyle(
                    fontSize: 48,
                    fontFamily: 'Windhavi',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhaseOne() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            // Outer circular progress bar (radius 120)
            SizedBox(
              width: 400,
              height: 400,
              child: CustomPaint(
                painter: CircularProgressBarPainter(
                  progress: _progressAnimation.value,
                  radius: 120,
                ),
              ),
            ),
            // Inner circular progress bar (radius 80)
            SizedBox(
              width: 400,
              height: 400,
              child: CustomPaint(
                painter: CircularProgressBarPainter(
                  progress: _progressAnimation.value,
                  radius: 80,
                ),
              ),
            ),
            // 'A' text with fade animation
            FadeTransition(
              opacity: _fadeAnimation,
              child: const Text(
                'A',
                style: TextStyle(
                  fontSize: 48,
                  fontFamily: 'Windhavi',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPhaseTwo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            // Outer circular progress bar (stopped at full rotation)
            SizedBox(
              width: 400,
              height: 400,
              child: CustomPaint(
                painter: CircularProgressBarPainter(
                  progress: 1.0, // Full rotation
                  radius: 120,
                ),
              ),
            ),
            // Inner circular progress bar (stopped at full rotation)
            SizedBox(
              width: SizeConfig.getWidth(400),
              height: SizeConfig.getHeight(400),
              child: CustomPaint(
                painter: CircularProgressBarPainter(
                  progress: 1.0, // Full rotation
                  radius: 80,
                ),
              ),
            ),
            // Initial 'A' faded but still visible
            Text(
              'A',
              style: TextStyle(
                fontSize: SizeConfig.getFont(48),
                fontFamily: 'Windhavi',
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        // Typewriter text 'Artsaya'
        AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(
              'Artsaya',
              textStyle: const TextStyle(
                fontFamily: 'Windhavi',
                fontSize: 50,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              speed: const Duration(milliseconds: 200),
            ),
          ],
          totalRepeatCount: 1,
          pause: const Duration(milliseconds: 300),
          displayFullTextOnTap: true,
          stopPauseOnTap: true,
        ),
      ],
    );
  }
}

/// Custom painter for drawing circular progress bars
class CircularProgressBarPainter extends CustomPainter {
  final double progress;
  final double radius;

  CircularProgressBarPainter({
    required this.progress,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final center = Offset(size.width / 2, size.height / 2);
    const startAngle = -3.14159 / 2; // Start from top
    final sweepAngle = 3.14159 * 2 * progress; // One complete rotation (2π)

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CircularProgressBarPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.radius != radius;
  }
}

enum AnimationPhase {
  fadeIn,      // Phase 1: 'A' with progress bars
  typewriter,  // Phase 2: Full text 'Artsaya' typing
  scale,       // Phase 3: Scale 'A' up
}

