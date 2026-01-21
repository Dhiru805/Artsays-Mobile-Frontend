import 'package:artsays_app/config/size_config.dart';
import 'package:flutter/material.dart';

import '../../../constants/image_asset_constant.dart';
import '../../../services/location_service/location_service.dart';

class UserInfoCard extends StatefulWidget implements PreferredSizeWidget {
  final String city;
  const UserInfoCard({super.key, required this.city});

  @override
  State<UserInfoCard> createState() => _UserInfoCardState();

  @override
  Size get preferredSize => const Size.fromHeight(150);
}

class _UserInfoCardState extends State<UserInfoCard> {
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
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0XFF48372D),
      elevation: 0,
      toolbarHeight: h * 0.18,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(w * 0.07)),
      ),

      title: Column(
        children: [
          /// 🔹 Top content (Logo + Location)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: w * 0.02),
                child: Image.asset(
                  ImageAssetConstant.Artsayslogo,
                  color: Colors.white,
                  height: h * 0.045,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.location_on_sharp),
                    color: Colors.white,
                    iconSize: w * 0.06,
                    onPressed: () {},
                  ),
                  Text(
                    widget.city,
                    style: TextStyle(
                      fontSize: w * 0.04,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: w * 0.02),
                ],
              ),
            ],
          ),

          /// 🔹 Floating User Card
          Padding(
            padding: EdgeInsets.all(8),
            child: Positioned(
              bottom: -h * 0.045,
              left: w * 0.04,
              right: w * 0.04,
              child: Container(
                padding: EdgeInsets.all(w * 0.03),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(w * 0.05),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    /// Avatar
                    CircleAvatar(
                      radius: w * 0.06,
                      backgroundImage: AssetImage(
                        ImageAssetConstant.profileImage,
                      ),
                    ),

                    SizedBox(width: w * 0.02),

                    /// User Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Neha Joshi",
                                style: TextStyle(
                                  fontSize: SizeConfig.getFont(16),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: w * 0.012),
                              Icon(
                                Icons.verified,
                                color: Colors.orange,
                                size: w * 0.04,
                              ),
                            ],
                          ),
                          SizedBox(height: h * 0.001),
                          Text(
                            "nehaj@gmail.com",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: SizeConfig.getFont(14),
                            ),
                          ),
                          Text(
                            "9988776655",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: SizeConfig.getFont(14),
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// Edit
                    Text(
                      "Edit",
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: SizeConfig.getFont(14),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
