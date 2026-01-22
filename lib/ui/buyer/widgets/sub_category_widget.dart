import 'package:artsays_app/ui/buyer/widgets/product_card.dart';
import 'package:flutter/material.dart';

import '../../../model/buyer_model/category_model.dart';

class SubCategoryWidget extends StatefulWidget {
  final SubCategory subCategory;

  const SubCategoryWidget({super.key, required this.subCategory});

  @override
  State<SubCategoryWidget> createState() => _SubCategoryWidgetState();
}

class _SubCategoryWidgetState extends State<SubCategoryWidget> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          ListTile(
            title: Text(
              widget.subCategory.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Icon(
              isExpanded ? Icons.expand_less : Icons.expand_more,
            ),
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
          ),

          if (isExpanded)
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.72,
              ),
              itemCount: widget.subCategory.products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: widget.subCategory.products[index],
                );
              },
            ),

          if (isExpanded)
            TextButton(
              onPressed: () {},
              child: const Text(
                "View More",
                style: TextStyle(color: Colors.deepOrange),
              ),
            )
        ],
      ),
    );
  }
}
