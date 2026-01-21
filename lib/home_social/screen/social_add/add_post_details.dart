import 'dart:io';

import 'package:artsays_app/constants/color_constant.dart';
import 'package:artsays_app/constants/svg_asset_constant.dart';
import 'package:artsays_app/home_social/widget/social_bottom_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../config/size_config.dart';

class AddPostDetails extends StatefulWidget {
  final File? imageFile;
  const AddPostDetails({super.key, this.imageFile});

  @override
  State<AddPostDetails> createState() => _AddPostDetailsState();
}

class _AddPostDetailsState extends State<AddPostDetails> {
  File? _selectedImage;
  final TextEditingController _captionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _postContent() {
    if (_selectedImage == null) return;
    // final caption = _captionController.text;
    // final location = _locationController.text;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Post uploaded successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    /// TODO: change here
    SizeConfig.init(context);
    final screenHeight = SizeConfig.screenHeight;
    final screenWidth = SizeConfig.screenWidth;

    return Scaffold(
      // backgroundColor: ColorConstant.backgroundColor,
      body: SocialBottomAnimation(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(screenWidth * 0.05),
                topRight: Radius.circular(screenWidth * 0.05),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: screenWidth * 0.02),

                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _selectedImage = null;
                        });
                      },
                      icon: Icon(Icons.close, size: screenWidth * 0.07),
                    ),
                  ),

                  // Image Preview
                  Container(
                    height: screenHeight * 0.35,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(screenWidth * 0.03),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    child: (widget.imageFile == null && _selectedImage == null)
                        ? GestureDetector(
                            onTap: _pickImage,
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.add_a_photo,
                                    size: screenWidth * 0.12,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  Text(
                                    'Tap to select image',
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.04,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(
                              screenWidth * 0.03,
                            ),
                            child: Image.file(
                              _selectedImage ?? widget.imageFile!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                  ),

                  SizedBox(height: screenHeight * 0.015),

                  // Caption Field
                  TextField(
                    controller: _captionController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: "Post Description",
                      hintStyle: TextStyle(
                        color: const Color.fromRGBO(170, 170, 170, 1),
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w400,
                      ),
                      filled: true,
                      fillColor: ColorConstant.lightPink,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          screenWidth * 0.015,
                        ),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          screenWidth * 0.015,
                        ),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          screenWidth * 0.015,
                        ),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                      ),
                      contentPadding: EdgeInsets.all(screenWidth * 0.03),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.012),

                  // Location field
                  TextField(
                    controller: _locationController,
                    decoration: InputDecoration(
                      hintText: "Add Location",
                      hintStyle: TextStyle(
                        color: const Color.fromRGBO(170, 170, 170, 1),
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w400,
                      ),
                      filled: true,
                      fillColor: ColorConstant.lightPink,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          screenWidth * 0.015,
                        ),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          screenWidth * 0.015,
                        ),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          screenWidth * 0.015,
                        ),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                      ),
                      contentPadding: EdgeInsets.all(screenWidth * 0.03),
                      suffixIcon: Icon(
                        Icons.location_on,
                        size: screenWidth * 0.06,
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.012),

                  // Collaborators Field
                  TextField(
                    controller: _locationController,
                    decoration: InputDecoration(
                      hintText: "Add Collaborators",
                      hintStyle: TextStyle(
                        color: const Color.fromRGBO(170, 170, 170, 1),
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w400,
                      ),
                      filled: true,
                      fillColor: ColorConstant.lightPink,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          screenWidth * 0.015,
                        ),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          screenWidth * 0.015,
                        ),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          screenWidth * 0.015,
                        ),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                      ),
                      contentPadding: EdgeInsets.all(screenWidth * 0.03),
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.025),
                        child: SvgPicture.asset(
                          SvgImageAssetConstant.collabIcon,
                          width: screenWidth * 0.05,
                          height: screenWidth * 0.05,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.02),

                  // Post button
                  SizedBox(
                    width: double.infinity,
                    height: screenHeight * 0.06,
                    child: ElevatedButton(
                      onPressed: _postContent,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstant.backgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            screenWidth * 0.08,
                          ),
                        ),
                      ),
                      child: Text(
                        "Post",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
