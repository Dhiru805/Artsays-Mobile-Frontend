import 'package:artsays_app/shared/widgets/hexagon_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomBarMenu extends StatelessWidget {
  final String selectedSvg; // path for selected SVG
  final String unselectedSvg; // path for unselected SVG
  final String name;
  final bool isSelected;
  final void Function() onTap;

  const BottomBarMenu({
    super.key,
    required this.name,
    required this.isSelected,
    required this.onTap,
    required this.selectedSvg,
    required this.unselectedSvg,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            isSelected
                ? HexagonBorder(
                    child: SvgPicture.asset(selectedSvg, height: 24, width: 24),
                  )
                : SvgPicture.asset(unselectedSvg, height: 24, width: 24),

            const SizedBox(height: 4),
            Text(
              name,
              style: GoogleFonts.montserrat(
                fontSize: 8,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
