// --- Reusable Product Card Widget ---
import 'package:flutter/material.dart';

class ArtistHomrHotDealSection extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String oldPrice;
  final String newPrice;

  const ArtistHomrHotDealSection({
    required this.imageUrl,
    required this.title,
    required this.oldPrice,
    required this.newPrice,
  });

  static const Color _primaryColor = Color(0xFF7F2424);
  static const Color _accentColor = Color(0xFFE44E2F);
  static const Color _oldPriceColor = Color(0xFFB5B5B5);

  @override
  Widget build(BuildContext context) {
    // Card width determined visually, typically slightly less than half the screen
    final cardWidth = MediaQuery.of(context).size.width * 0.45;

    return Container(
      width: cardWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image and Overlays (Premium Tag & Discount Ribbon)
          Stack(
            children: [
              // Main Image
              AspectRatio(
                aspectRatio: 1, // Square image as seen in the original
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.asset(
                    imageUrl, // Replace with a real image path
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.yellow.shade200,
                      alignment: Alignment.center,
                      child: const Text(
                        'Art Image',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                ),
              ),

              // Premium Tag (Top Left)
              Positioned(
                top: 10,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                    ),
                  ),
                  child: const Text(
                    'Premium',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // 70% Off Ribbon (Top Right)
              Positioned(
                top: 0,
                right: 0,
                child: Transform.rotate(
                  angle: 0.785, // Rotate 45 degrees (pi/4)
                  origin: const Offset(40, -40),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 20,
                    ),
                    color: _accentColor,
                    child: const Text(
                      '70% off',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Product Details (Bottom)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 4),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Old Price (Strikethrough)
                        Text(
                          oldPrice,
                          style: TextStyle(
                            fontSize: 10,
                            color: _oldPriceColor,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        // New Price
                        Text(
                          newPrice,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: _primaryColor,
                          ),
                        ),
                      ],
                    ),

                    // Heart Icon
                    const Padding(
                      padding: EdgeInsets.only(right: 4.0),
                      child: Icon(
                        Icons.favorite_border,
                        color: _oldPriceColor,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
