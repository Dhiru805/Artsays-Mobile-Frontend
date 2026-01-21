import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:artsays_app/home_social/profileTabBar/widget/custom_slder_container_profile_join.dart';
import 'package:artsays_app/home_social/profileTabBar/widget/products_card.dart';
import 'package:flutter/material.dart';

import '../../../config/size_config.dart';

class ProductsTabBarView extends StatelessWidget {
  const ProductsTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final List<ProductsCard> products = [
      ProductsCard(
        image: ImageAssetConstant.waterBoat,
        title: "Medieval Sculpture",
        subtitle: "Lorem ipsum dolor sit lala color amet,consectetu",
      ),
      ProductsCard(
        image: ImageAssetConstant.waterBoat,
        title: "Vintage Pottery",
        subtitle: "Lorem ipsum dolor sit lala color amet,consectetu",
      ),
    ];

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.03),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: screenWidth > 600
                ? 3
                : 2, // 3 on tablet, 2 on mobile
            mainAxisSpacing: screenHeight * 0.008,
            crossAxisSpacing: screenWidth * 0.025,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return ProductGridBox(
              image: product.image,
              title: product.title,
              subtitle: product.subtitle,
            );
          },
        ),
      ),
      bottomSheet: BottomSheet(
        shadowColor: Colors.transparent,
        dragHandleColor: Colors.transparent,
        onClosing: () {},
        backgroundColor: Colors.transparent,
        builder: (context) {
          return CustomSlderContainerProfileJoin();
        },
      ),
    );
  }
}

class ProductGridBox extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const ProductGridBox({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final screenHeight = SizeConfig.screenHeight;
    final screenWidth = SizeConfig.screenWidth;

    return Column(
      children: [
        // image container
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(screenWidth * 0.04),
            color: ColorConstant.backgroundColor,
          ),
          clipBehavior: Clip.hardEdge,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              // image background
              Container(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.02,
                  bottom: screenHeight * 0.03,
                ),
                margin: EdgeInsets.only(bottom: screenHeight * 0.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(screenWidth * 0.04),
                  color: const Color(0xFFBAB6B6),
                ),
                child: Image.asset(
                  image,
                  height: screenHeight * 0.15,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              // brown overlay with text
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorConstant.backgroundColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(screenWidth * 0.04),
                    bottomRight: Radius.circular(screenWidth * 0.04),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.007,
                  horizontal: screenWidth * 0.025,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                    Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: screenWidth * 0.025,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
