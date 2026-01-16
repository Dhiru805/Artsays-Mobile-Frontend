import 'package:artsays_app/certification/artist_screens/screens/artist_home_screen.dart';
import 'package:artsays_app/certification/artist_screens/screens/bid_rid_screen.dart';
import 'package:artsays_app/certification/widget/certification_appbar.dart';
import 'package:artsays_app/certification/widget/certification_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class CertificationMainScreen extends StatefulWidget {
  const CertificationMainScreen({super.key});

  @override
  State<CertificationMainScreen> createState() =>
      _CertificationMainScreenState();
}

class _CertificationMainScreenState extends State<CertificationMainScreen> {
  int _selectedIndex = 0;

  // 🔹 Screens list — these will change based on the bottom nav index
  final List<Widget> _screens = [
    ArtistHomeScreen(),
    BidRidScreen(),
    ArtistHomeScreen(),
    ArtistHomeScreen(),
  ];

  // 🔹 AppBar titles based on selected screen
  final List<String> _titles = ["Home", "Bids", "Categories", "Profile"];

  // 🔹 Handle bottom bar item tap
  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // 🔹 Handle create certification button tap
  void _onCreateCertificationTap() {
    // You can navigate to your certification creation screen here
    Navigator.pushNamed(context, '/createCertification');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // 🔹 AppBar
      appBar: const CertificationAppbar(),

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
