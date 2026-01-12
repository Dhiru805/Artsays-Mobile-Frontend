import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextfield extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;
  const MyTextfield({
    super.key,
    required this.text,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: GoogleFonts.montserrat(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      cursorColor: color,

      decoration: InputDecoration(
        hintText: text,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Icon(icon, color: color),
        ),
        hintStyle: GoogleFonts.montserrat(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: 24,
          minHeight: 20,
          maxHeight: 20,
          maxWidth: 24,
        ),
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: color, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: color, width: 1),
        ),
      ),
    );
  }
}
