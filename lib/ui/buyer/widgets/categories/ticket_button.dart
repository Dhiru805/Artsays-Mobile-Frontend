import 'package:artsays_app/config/size_config.dart';
import 'package:flutter/material.dart';

class TicketButton extends StatefulWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const TicketButton({
    super.key,
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<TicketButton> createState() => _TicketButtonState();
}

class _TicketButtonState extends State<TicketButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        child: ClipPath(
          clipper: TicketClipper(),
          child: Container(
            width: SizeConfig.getWidth(500), // Adjust width as needed
            height: SizeConfig.getHeight(55),
            decoration: BoxDecoration(
              // Use the exact colors from your screenshot
              color: widget.isActive
                  ? const Color(0xFFFF5733)
                  : const Color(0x8BEFEEEE),
            ),
            child: Center(
              child: Text(
                widget.title,
                style: TextStyle(
                  color: widget.isActive ? Colors.white : Colors.black87,
                  fontWeight: widget.isActive ? FontWeight.bold : FontWeight.normal,fontSize: SizeConfig.getFont(16),
                  // fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start drawing the path
    path.lineTo(0, size.height); // Left side
    path.lineTo(size.width, size.height); // Bottom side
    path.lineTo(size.width, 0); // Right side

    // Create Right Semi-circle Notch
    path.addOval(
      Rect.fromCircle(center: Offset(size.width, size.height / 2), radius: 8),
    );

    // Create Left Semi-circle Notch
    path.addOval(
      Rect.fromCircle(center: Offset(0, size.height / 2), radius: 8),
    );

    // Use fillType 'evenOdd' to create the "cutout" effect
    path.fillType = PathFillType.evenOdd;

    // Add rounded corners to the main rectangle
    return Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          const Radius.circular(12),
        ),
      )
      ..addOval(Rect.fromCircle(center: Offset(0, size.height / 2), radius: 8))
      ..addOval(
        Rect.fromCircle(center: Offset(size.width, size.height / 2), radius: 8),
      )
      ..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
