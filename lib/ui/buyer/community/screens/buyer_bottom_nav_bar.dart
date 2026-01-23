import 'package:artsays_app/certification/artist_screens/screens/artist_home_screen.dart';
import 'package:artsays_app/certification/artist_screens/screens/bid_rid_screen.dart';
import 'package:artsays_app/certification/widget/certification_appbar.dart';
import 'package:artsays_app/certification/widget/certification_bottom_nav_bar.dart';
import 'package:artsays_app/ui/buyer/screens/categories_screen.dart';
import 'package:artsays_app/ui/buyer/widgets/user_info_card.dart';
import 'package:flutter/material.dart';

import '../../../../services/location_service/location_service.dart';
import '../../screens/profile_page.dart';

class BuyerBottomNavBar extends StatefulWidget {
  const BuyerBottomNavBar({super.key});

  @override
  State<BuyerBottomNavBar> createState() =>
      _BuyerBottomNavBarState();
}

class _BuyerBottomNavBarState extends State<BuyerBottomNavBar> {
  int _selectedIndex = 0;

  // 🔹 Screens list — these will change based on the bottom nav index
  final List<Widget> _screens = [
    ArtistHomeScreen(),
    BidRidScreen(),
    CategoriesScreen(),
    ProfilePage(),
  ];

  // 🔹 AppBar titles based on selected screen
  // final List<String> _titles = ["Home", "Bids", "Categories", "Profile"];

  // 🔹 Handle bottom bar item tap
  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // 🔹 Handle create certification button tap
  // void _onCreateCertificationTap() {
  //   // You can navigate to your certification creation screen here
  //   Navigator.pushNamed(context, '/createCertification');
  // }

  String city = "Fetching...";

  @override
  void initState() {
    super.initState();
    fetchCity();
  }

  Future<void> fetchCity() async {
    final fetchedCity = await LocationService.getCityName();
    setState(() {
      city = fetchedCity;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // 🔹 AppBar
      appBar: _selectedIndex == 3 ? UserInfoCard(city: city,) : CertificationAppbar(city: city,),

      // 🔹 Body (screen changes dynamically)
      body: _screens[_selectedIndex],

      // 🔹 Custom Bottom Navigation Bar
      bottomNavigationBar: CertificationBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemSelected,
      ),
    );
  }
}
