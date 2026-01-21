import 'dart:async';
import 'dart:math';

import 'package:artsays_app/config/size_config.dart';
import 'package:artsays_app/onboard/screen/spalsh_screen.dart.dart';
import 'package:flutter/material.dart';

import '../../constants/color_constant.dart';

enum SplashStage { loader, typing, zoom }

class OneTimeSplashScreen extends StatefulWidget {
  const OneTimeSplashScreen({super.key});

  @override
  State<OneTimeSplashScreen> createState() => _OneTimeSplashScreenState();
}

class _OneTimeSplashScreenState extends State<OneTimeSplashScreen> {
  SplashStage _stage = SplashStage.loader;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (_stage == SplashStage.zoom)
              ZoomOutCharacter(
                character: "A",
                onCompleted: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const SplashScreen(showAnimation: false, isEarlierLoggedIn: false,),
                    ),
                  );
                },
              ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_stage == SplashStage.loader)
                  DoubleRingLoader(
                    size: 120,
                    duration: const Duration(seconds: 2),
                    onCompleted: () {
                      setState(() => _stage = SplashStage.typing);
                    },
                  ),

                if (_stage == SplashStage.typing)
                  TypewriterReverseText(
                    text: "Artsays",
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: SizeConfig.getFont(36),
                      fontFamily: 'Windhavi',
                      fontWeight: FontWeight.w600,
                    ),
                    repeat: false,
                    onCompleted: () {
                      setState(() => _stage = SplashStage.zoom);
                    },
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// ─────────────────────────────────────────────
/// DOUBLE RING LOADER (RUNS ONCE)
/// ─────────────────────────────────────────────

class DoubleRingLoader extends StatefulWidget {
  final double size;
  final Duration duration;
  final VoidCallback onCompleted;

  const DoubleRingLoader({
    super.key,
    required this.size,
    required this.duration,
    required this.onCompleted,
  });

  @override
  State<DoubleRingLoader> createState() => _DoubleRingLoaderState();
}

class _DoubleRingLoaderState extends State<DoubleRingLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onCompleted();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Transform.rotate(
                angle: 2 * pi * _controller.value,
                child: CustomPaint(
                  size: Size(widget.size, widget.size),
                  painter: _RingPainter(
                    radiusOffset: 6,
                    strokeWidth: 1,
                    opacity: 1,
                  ),
                ),
              ),
              Text(
                'A',
                style: TextStyle(
                  fontFamily: 'Windhavi',
                  fontSize: SizeConfig.getFont(36),
                  color: ColorConstant.white,
                ),
              ),
              Transform.rotate(
                angle: 2 * pi * _controller.value,
                child: CustomPaint(
                  size: Size(widget.size, widget.size),
                  painter: _RingPainter(
                    radiusOffset: 18,
                    strokeWidth: 1,
                    opacity: 1,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  final double radiusOffset;
  final double strokeWidth;
  final double opacity;

  _RingPainter({
    required this.radiusOffset,
    required this.strokeWidth,
    required this.opacity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = size.width / 2 - radiusOffset;

    final paint = Paint()
      ..color = Colors.white.withOpacity(opacity)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      pi * 0.4,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// ─────────────────────────────────────────────
/// TYPEWRITER TEXT (CALLS onCompleted)
/// ─────────────────────────────────────────────

class TypewriterReverseText extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final Duration typingSpeed;
  final Duration deletingSpeed;
  final Duration pauseDuration;
  final bool repeat;
  final VoidCallback onCompleted;

  const TypewriterReverseText({
    super.key,
    required this.text,
    required this.textStyle,
    this.typingSpeed = const Duration(milliseconds: 100),
    this.deletingSpeed = const Duration(milliseconds: 120),
    this.pauseDuration = const Duration(milliseconds: 1000),
    required this.repeat,
    required this.onCompleted,
  });

  @override
  State<TypewriterReverseText> createState() => _TypewriterReverseTextState();
}

class _TypewriterReverseTextState extends State<TypewriterReverseText> {
  String _displayedText = "";
  int _index = 0;
  bool _isDeleting = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() {
    _timer = Timer.periodic(widget.typingSpeed, (timer) {
      if (_index < widget.text.length) {
        setState(() {
          _displayedText += widget.text[_index];
          _index++;
        });
      } else {
        timer.cancel();
        Future.delayed(widget.pauseDuration, () {
          _isDeleting = true;
          _startDeleting();
        });
      }
    });
  }

  void _startDeleting() {
    _timer = Timer.periodic(widget.deletingSpeed, (timer) {
      if (_displayedText.isNotEmpty) {
        setState(() {
          _displayedText = _displayedText.substring(
            0,
            _displayedText.length - 1,
          );
        });
      } else {
        timer.cancel();
        widget.onCompleted();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(_displayedText, style: widget.textStyle);
  }
}

/// ─────────────────────────────────────────────
/// ZOOM OUT CHARACTER (FINAL)
/// ─────────────────────────────────────────────

class ZoomOutCharacter extends StatefulWidget {
  final String character;
  final VoidCallback onCompleted;

  const ZoomOutCharacter({
    super.key,
    required this.character,
    required this.onCompleted,
  });

  @override
  State<ZoomOutCharacter> createState() => _ZoomOutCharacterState();
}

class _ZoomOutCharacterState extends State<ZoomOutCharacter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;
  bool _hasCalled = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scale = Tween<double>(
      begin: 0,
      end: 130,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    /// Listen for completion
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && !_hasCalled) {
        _hasCalled = true;
        widget.onCompleted();
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scale,
      builder: (_, child) {
        return Transform.scale(
          scale: _scale.value,
          child: child,
        );
      },
      child: Text(
        widget.character,
        style: TextStyle(
          color: Colors.white,
          fontSize: SizeConfig.getFont(100),
          fontWeight: FontWeight.bold,
          fontFamily: 'Windhavi',
        ),
      ),
    );
  }
}

