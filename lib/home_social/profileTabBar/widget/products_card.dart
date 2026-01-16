import 'package:artsays_app/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const ProductsCard({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 353,
      decoration: BoxDecoration(
        color: ColorConstant.backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              image,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.publicSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.montserrat(
                    fontSize: 7,
                    color: Color(0XFFB7B7B7),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
