import 'package:artsays_app/constants/image_asset_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late double screenWidth;

  late double screenHeight;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    final notifications = <Map<String, String>>[
      {
        'name': 'thatoneweirdo',
        'action': 'liked your post',
        'time': '2h',
        'image': ImageAssetConstant.profileImage,
      },
      {
        'name': 'artlover99',
        'action': 'commented: Nice work!',
        'time': '4h',
        'image': ImageAssetConstant.profileImage,
      },
      {
        'name': 'collector',
        'action': 'started following you',
        'time': '1d',
        'image': ImageAssetConstant.profileImage,
      },
      {
        'name': 'gallery_owner',
        'action': 'liked your post',
        'time': '3d',
        'image': ImageAssetConstant.profileImage,
      },
      {
        'name': 'neha_s',
        'action':
            'commented: This piece is honestly stunning. The way you’ve blended the colors and paid attnt into it. There’ eally pulls the viewer in. You’ve got such a unique style, can’t wait to see more from you!"',
        'time': '1w',
        'image': ImageAssetConstant.profileImage,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        // color: Colors.red,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.02,
            vertical: screenHeight * 0.005,
          ),
          itemCount: notifications.length,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final item = notifications[index];
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              decoration: BoxDecoration(
                color: Color(0xFFFFF5EB),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage(item['image']!),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: item['name']!,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                          const TextSpan(text: ' '),
                          TextSpan(
                            text: item['action']!,
                            style: const TextStyle(
                              fontSize: 14, // 👈 custom font size
                              color: Colors.black, // 👈 custom color
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Row(
                    children: [
                      Text(
                        item['time']!,
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.more_horiz_outlined, size: 20),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                            ),
                            builder: (_) => SafeArea(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  ListTile(title: Text('Mute')),
                                  ListTile(
                                    title: Text('Turn off notifications'),
                                  ),
                                  ListTile(title: Text('Report')),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),

      // ✅ Bottom Navigation Bar
    );
  }
}
