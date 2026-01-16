import 'package:artsays_app/certification/artist_screens/screens/artist_homr_hot_deal_section.dart';
import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:flutter/material.dart';

class ArtistHomeScreen extends StatefulWidget {
  @override
  _ArtistHomeScreenState createState() => _ArtistHomeScreenState();
}

class _ArtistHomeScreenState extends State<ArtistHomeScreen> {
  final PageController _imageController = PageController();
  final PageController _recommendationController = PageController();
  int _currentImageIndex = 0;
  int _currentTabIndex = 0;

  final List<String> imageSliders = [
    ImageAssetConstant.homeSlider1,
    ImageAssetConstant.homeSlider1,

    ImageAssetConstant.homeSlider1,
  ];

  final List<String> tabs = [
    'Paintings',
    'Sculptures',
    'Digital Art',
    'Ceramics & Pottery',
    'Installation Art',
  ];

  final List<Map<String, String>> recommendations = [
    {
      'title': 'Handelstal glass material',
      'subtitle': 'to your tone',
      'image':
          'https://via.placeholder.com/150x120/FF6B6B/FFFFFF?text=Glass+Art',
    },
    {
      'title': 'Virtuable Art',
      'subtitle': 'by Mrs. Virtuable',
      'image':
          'https://via.placeholder.com/150x120/4ECDC4/FFFFFF?text=Virtuable+Art',
    },
    {
      'title': 'Modern Ceramics',
      'subtitle': 'by Contemporary Artists',
      'image':
          'https://via.placeholder.com/150x120/45B7D1/FFFFFF?text=Ceramics',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Text

              // Image Slider
              _buildImageSlider(),

              // Tabs Slider
              _buildTabSlider(),

              // Recommended for you text
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                child: Text(
                  'Recommended for you',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: ColorConstant.orange,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 5, 16, 16),
                child: Text(
                  'Handpicked pieces matched to your taste',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: ColorConstant.orange,
                  ),
                ),
              ),

              // Recommendations Slider
              _buildRecommendationsSlider(),

              HeaderSection(),

              SizedBox(height: 20),

              _buildBannerSection(),
              _buildHotDealsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageSlider() {
    return Container(
      height: 250,
      child: Stack(
        children: [
          PageView.builder(
            controller: _imageController,
            itemCount: imageSliders.length,
            onPageChanged: (index) {
              setState(() {
                _currentImageIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(imageSliders[index]),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
              );
            },
          ),

          // Dots indicator
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(imageSliders.length, (index) {
                return Container(
                  width: 8,
                  height: 8,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentImageIndex == index
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabSlider() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          bool isSelected = _currentTabIndex == index;

          return Container(
            margin: EdgeInsets.only(
              right: isSelected ? 8 : 8,
            ), // Remove right margin for selected tab
            child: ChoiceChip(
              label: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 2,
                ), // Reduced internal padding
                child: Text(
                  tabs[index],
                  style: TextStyle(
                    color: isSelected
                        ? Colors.white
                        : ColorConstant.backgroundColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              selected: isSelected,
              selectedColor: ColorConstant.backgroundColor,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50), // Added border radius
                side: BorderSide(
                  color: ColorConstant.backgroundColor,
                  width: 1,
                ),
              ),
              onSelected: (selected) {
                setState(() {
                  _currentTabIndex = index;
                });
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildRecommendationsSlider() {
    final List<String> mandalaImages = [
      ImageAssetConstant.grassField,
      ImageAssetConstant.grassField,
      ImageAssetConstant.grassField,
      ImageAssetConstant.grassField,
      ImageAssetConstant.grassField,
      ImageAssetConstant.grassField,
    ];

    final PageController _pageController = PageController(
      viewportFraction: 0.33,
      initialPage: 0,
    );

    return SizedBox(
      height: 170,
      child: Align(
        alignment: Alignment.centerLeft, // ✅ Keeps first card aligned left
        child: PageView.builder(
          controller: _pageController,
          padEnds: false, // ✅ Removes extra white space at start & end
          scrollDirection: Axis.horizontal,
          itemCount: mandalaImages.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: ColorConstant.backgroundColor.withOpacity(0.5),
                  width: 1.2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ---------- IMAGE SECTION ----------
                    Expanded(
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              mandalaImages[index],
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),

                          // "P" badge top-left
                          Positioned(
                            top: 8,
                            left: 8,
                            child: Container(
                              width: 22,
                              height: 22,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: ColorConstant.backgroundColor,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Text(
                                'P',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),

                          // Heart icon bottom-right
                          Positioned(
                            bottom: 8,
                            right: 8,
                            child: Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                color: ColorConstant.backgroundColor,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: const Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // ---------- TEXT BELOW IMAGE ----------
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 5,
                      ),
                      child: const Text(
                        'Mandala Art by Shr..',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: ColorConstant.backgroundColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget HeaderSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Main heading
          Text(
            'Spotted : Your faves, Their Walls, Our Art',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorConstant.orange,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          // "Checkout celebrities who shop from Artsays"
          const Text(
            'Checkout celebrities who shop from Artsays',
            textAlign: TextAlign.center,
            style: TextStyle(color: ColorConstant.orange, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildBannerSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0),
      child: AspectRatio(
        aspectRatio: 335 / 220, // Approximate aspect ratio of the image
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Placeholder Image (Use a NetworkImage or AssetImage in a real app)
              Image.asset(
                ImageAssetConstant
                    .bannerIamge, // Replace with a real image path
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey.shade300,
                  alignment: Alignment.center,
                  // child: const Text(
                  //   'Banner Image',
                  //   style: TextStyle(color: Colors.black54),
                  // ),
                ),
              ),

              // Overlay content for text and button
              Positioned(
                bottom: 20,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text lines
                    const Text(
                      'Adecision gc see am on',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        shadows: [Shadow(blurRadius: 4, color: Colors.black)],
                      ),
                    ),
                    const Text(
                      'wlut your banners.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        shadows: [Shadow(blurRadius: 4, color: Colors.black)],
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Explore Collection Button
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: ColorConstant.orange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Explore Collection Now',
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Hot Deals Section Widget ---
  Widget _buildHotDealsSection() {
    return Container(
      color: ColorConstant.backgroundColor,
      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Timer Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Hot Deals Text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Hot deals',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Grab them before they're gone",
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),

                // Timer Bubble
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white38),
                  ),
                  child: const Text(
                    'Offer ends in 2:59 min',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          // Horizontal Product List
          SizedBox(
            height: 300, // Fixed height for horizontal list
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 16.0),
              children: const [
                // Replicate the card two times as seen in the image
                ArtistHomrHotDealSection(
                  imageUrl: 'assets/mandala_placeholder.jpg',
                  title: 'Mandala Art by Shr...',
                  oldPrice: '₹72,12,999',
                  newPrice: '₹62,79,749',
                ),
                SizedBox(width: 15),
                ArtistHomrHotDealSection(
                  imageUrl: 'assets/mandala_placeholder.jpg',
                  title: 'Mandala Art by Shr...',
                  oldPrice: '₹72,12,999',
                  newPrice: '₹62,79,749',
                ),
                SizedBox(width: 15),
                // Add more cards here if needed
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _imageController.dispose();
    _recommendationController.dispose();
    super.dispose();
  }
}
