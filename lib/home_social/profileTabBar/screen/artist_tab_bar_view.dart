import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:artsays_app/home_social/profileTabBar/widget/custom_slder_container_profile_join.dart';
import 'package:artsays_app/home_social/profileTabBar/widget/profile_join_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArtistTabBarView extends StatefulWidget {
  const ArtistTabBarView({super.key});

  @override
  State<ArtistTabBarView> createState() => _ArtistTabBarViewState();
}

class _ArtistTabBarViewState extends State<ArtistTabBarView> {
  bool _showSuggested = false; // initially hidden

  void showSuggested() {
    setState(() {
      _showSuggested = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final List<ProfileJoinCard> profileCards = [
      ProfileJoinCard(
        image: ImageAssetConstant.profileCardImage,
        title: 'Handmade Art',
        username: 'abd_abd',
        onJoin: () {},
      ),
      ProfileJoinCard(
        image: ImageAssetConstant.profileCardImage,
        title: 'Sketch Studio',
        username: 'artlover',
        onJoin: () {},
      ),
      ProfileJoinCard(
        image: ImageAssetConstant.profileCardImage,
        title: 'Clay Works',
        username: 'potter_pro',
        onJoin: () {},
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // 🎨 Suggested section (shows only when _showSuggested = true)
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOutCubic,
            top: _showSuggested ? 0 : screenHeight,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              opacity: _showSuggested ? 1 : 0,
              duration: const Duration(milliseconds: 400),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 16,
                      ),
                      child: Text(
                        "Suggested for you",
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: profileCards.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.75,
                          ),
                      itemBuilder: (context, index) {
                        return profileCards[index];
                      },
                    ),
                    SizedBox(height: screenHeight * 0.08),
                  ],
                ),
              ),
            ),
          ),

          // 🟣 Bottom sheet stays always visible
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomSlderContainerProfileJoin(
              onAddTap: showSuggested, // ⬅️ callback for icon press
            ),
          ),
        ],
      ),
    );
  }
}
