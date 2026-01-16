import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPopupMenuItemData {
  final String label;
  final VoidCallback onTap;

  CustomPopupMenuItemData({required this.label, required this.onTap});
}

class CustomPopupMenu extends StatelessWidget {
  final List<CustomPopupMenuItemData> items;
  final String iconDir;

  const CustomPopupMenu({
    super.key,
    required this.items,
    required this.iconDir,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      padding: EdgeInsets.zero,
      color: Colors.white,
      icon: iconDir == "horizontal"
          ? const Icon(Icons.more_vert, color: Colors.white)
          : const Icon(Icons.more_horiz, color: Colors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      offset: const Offset(0, -75), // Moves the menu above the icon
      onSelected: (index) => items[index].onTap(),
      itemBuilder: (context) => List.generate(
        items.length,
        (index) => PopupMenuItem(
          value: index,
          height: 20,
          child: Text(
            items[index].label,
            style: GoogleFonts.montserrat(
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
