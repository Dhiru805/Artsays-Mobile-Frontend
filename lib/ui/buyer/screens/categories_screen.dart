import 'package:flutter/material.dart';

import '../widgets/categories/ticket_button.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  /// 🔹 Single source of truth
  int selectedCategoryIndex = 0;

  /// 🔹 Mock data (replace with API response later)
  final List<Map<String, dynamic>> categoriesData = [
    {
      "title": "Painting",
      "subCategories": [
        "Acrylic Painting",
        "Canvas Painting",
        "Minimalism",
        "Abstract",
      ],
    },
    {
      "title": "Sculpture",
      "subCategories": ["Stone Sculpture", "Metal Sculpture"],
    },
    {
      "title": "Digital Art",
      "subCategories": ["NFT Art", "Concept Art"],
    },
    {
      "title": "Artifact",
      "subCategories": ["Ancient", "Modern"],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final List<String> selectedSubCategories =
        categoriesData[selectedCategoryIndex]["subCategories"];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          /// ================= LEFT SIDEBAR =================
          Container(
            width: 150,
            color: const Color(0xFFF1F5F9),
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "Categories",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),

                /// 🔹 Category buttons
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: categoriesData.length,
                  itemBuilder: (context, index) {
                    return TicketButton(
                      title: categoriesData[index]["title"],
                      isActive: selectedCategoryIndex == index,
                      onTap: () {
                        setState(() {
                          selectedCategoryIndex = index;
                        });
                      },
                    );
                  },
                ),
              ],
            ),
          ),

          /// Divider
          const VerticalDivider(width: 1, thickness: 1, color: Colors.grey),

          /// ================= RIGHT CONTENT =================
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text(
                  "Sub Categories",
                  style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),

                /// 🔹 Dynamic Sub Categories
                ...selectedSubCategories.map(
                  (subCategory) => _buildExpansionSection(subCategory),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// ================= EXPANSION TILE =================
  Widget _buildExpansionSection(String title) {
    return Card(
      elevation: 0,
      color: const Color(0xFFF1F5F9),
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        shape: const Border(),
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    _buildProductCard(),
                    const SizedBox(width: 8),
                    _buildProductCard(),
                  ],
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  ),
                  child: const Text(
                    "View More",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// ================= PRODUCT CARD =================
  Widget _buildProductCard() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(8),
                  ),
                  child: Image.network(
                    'https://picsum.photos/200',
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 6,
                  left: 6,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      "Premium",
                      style: TextStyle(color: Colors.white, fontSize: 9),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(6),
              child: Text(
                "Mandala Art by Artist",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 11),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                "₹62,79,749",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}
