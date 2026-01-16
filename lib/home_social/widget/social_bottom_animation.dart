import 'package:flutter/material.dart';

class SocialBottomAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Offset beginOffset;
  final Duration delay;

  const SocialBottomAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1200),
    this.beginOffset = const Offset(0, 0.4),
    this.delay = Duration.zero,
  });

  @override
  State<SocialBottomAnimation> createState() => _SocialBottomAnimationState();
}

class _SocialBottomAnimationState extends State<SocialBottomAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  bool _started = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);

    final curved = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
    );

    _slideAnimation = Tween<Offset>(
      begin: widget.beginOffset,
      end: Offset.zero,
    ).animate(curved);

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(curved);

    // Ensure animations start safely after widget mounts
    Future.microtask(() async {
      await Future.delayed(widget.delay);
      if (mounted && !_started) {
        _started = true;
        _controller.forward();
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
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(position: _slideAnimation, child: widget.child),
    );
  }
}
